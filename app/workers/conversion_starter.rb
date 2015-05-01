class ConversionStarter 
  include Sidekiq::Worker
  sidekiq_options queue: :conversion

  def perform
    [
      ArenaOccurrenceAttendance,
      ArenaPerson,
      ArenaFamily,
      ArenaPersonAttribute,
      ArenaSmallGroup,
      ArenaProfile
    ].each {|klass| queue_record_sync klass}
  end

  def queue_record_sync(klass)
    klass.all.pluck(klass.primary_key).each do |pk|
      ConversionWorker.perform_async(klass.name,pk)
    end
  end
end
