class ConversionWorker
  include Sidekiq::Worker
  sidekiq_options queue: :conversion, unique: :until_and_while_executing

  def perform(*args)
    klass_name,id = args.slice!(0..1)
    klass_name.constantize.find(id).sync_to_rock! *args
  end
end
