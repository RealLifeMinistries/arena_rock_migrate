class ConversionStarter
  include Sidekiq::Worker
  sidekiq_options queue: :conversion, unique: :true

  def perform
    [
      ArenaOccurrenceAttendance,
      ArenaPerson,
      ArenaFamily,
      ArenaFamilyMember,
      ArenaPersonAttribute,
      ArenaSmallGroup,
      ArenaSmallGroupMember,
      ArenaProfile,
      ArenaProfileMember,
      ArenaCampus,
    ].each {|klass| queue_record_sync klass}
  end

  def queue_record_sync(klass)
    record_ids = []
    scope = klass.all

    if klass.column_names.include?('date_modified')
      ######################################
      # Track by date_modified field
      # Only process records modified after last run
      #

      cache_key = "conversion:#{klass.name}:lastrun"

      lastRun = Rails.cache.read(cache_key) || Time.new(1900)
      scope = scope.where("date_modified > ?",lastRun)
      Rails.cache.write(cache_key,Time.now)

      if klass.primary_key.is_a?(Array)
        record_ids = scope.pluck(*klass.primary_key)
      else
        record_ids = scope.pluck(klass.primary_key)
      end

    elsif !klass.primary_key.is_a?(Array)
      #######################################
      # No date_modified field, and primary key is a single integer
      # Get records created after last record processed
      # (New records only)
      #

      cache_key = "conversion:#{klass.name}:lastRecord"
      lastRecord = Rails.cache.read(cache_key) || 0

      scope = scope.where("#{klass.primary_key} > ?",lastRecord)
      record_ids = scope.pluck(*klass.primary_key)

      lastId = record_ids.max_by{|id| id.to_i}
      Rails.cache.write(cache_key,lastId)
    else
      #######################################
      # No way to know what's modified or new, process all records
      #

      record_ids = scope.pluck(klass.primary_key)
    end

    record_ids.each do |pk|
      ConversionWorker.perform_async(klass.name,pk)
    end
  end
end
