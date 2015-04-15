class TaskStarter
  include Sidekiq::Worker

  def perform
    arena_q = Sidekiq::Queue.new('arena')
    rock_q = Sidekiq::Queue.new('rock')
    conversion_q = Sidekiq::Queue.new('conversion')

    conversion_running = conversion_q.size > 0
    arena_running = arena_q.size > 0
    rock_running = rock_q.size > 0
  
    return if conversion_running

    unless Rails.cache.read('task:conversion')
      unless (arena_running || rock_running)
        conversion_running = true 
        Rails.cache.write('task:conversion',true)
        DataSync.peform_async
      end
    else
      unless arena_running
        ArenaSync.perform_async
        Rails.cache.write('task:conversion',false)
      end 
      unless rock_running
        RockSync.perform_async
        Rails.cache.write('task:conversion',false)
      end 
    end

  end
end
