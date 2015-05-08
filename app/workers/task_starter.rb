class TaskStarter
  include Sidekiq::Worker
  sidekiq_options unique: true

  def perform
    retries = Sidekiq::RetrySet.new
    default_q = Sidekiq::Queue.new()
    conversion_q = Sidekiq::Queue.new('conversion')
    arena_q = Sidekiq::Queue.new('arena')
    rock_q = Sidekiq::Queue.new('rock')

    if default_q.size > 0 || retries.size > 0 || conversion_q.size > 0 || arena_q.size > 0 || rock_q.size > 0
      puts 'jobs are running; quiting'
      return
    end

    if Rails.cache.read('task:conversion')
      Rails.cache.write('task:conversion',false)
      puts 'queuing Conversion'
      ConversionStarter.perform_async
    else
      Rails.cache.write('task:conversion',true)
      puts 'queueing arena & rock sync'
      ArenaSync.perform_async
      RockSync.perform_async
    end

  end
end
