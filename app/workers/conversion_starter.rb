class ConversionStarter 
  include Sidekiq::Worker
  sidekiq_options queue: :conversion, unique: true

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
    ].each {|klass| queue_record_sync klass}
  end

  def queue_record_sync(klass)
    cache_key = "conversion:#{klass.name}:lastrun"
    record_ids = []
    scope = klass.all

    if klass.column_names.include?('date_modified')
      lastRun = Rails.cache.read(cache_key) || Time.new(1900)

      scope = scope.where("date_modified > ?",lastRun)

      Rails.cache.write(cache_key,Time.now)
    end

    if klass.primary_key.is_a?(Array)
      record_ids = scope.pluck(*klass.primary_key)
    else
      record_ids = scope.pluck(klass.primary_key)
    end

    record_ids.each do |pk|
      ConversionWorker.perform_async(klass.name,pk)
    end
  end
end
