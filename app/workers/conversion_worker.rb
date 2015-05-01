class ConversionWorker 
  include Sidekiq::Worker
  sidekiq_options queue: :conversion, unique: true

  def perform(klass_name,id)
    klass_name.constantize.find(id).sync_to_rock!
  end
end
