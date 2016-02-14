class ArenaRecordSync
  include Sidekiq::Worker
  sidekiq_options queue: :arena, unique:true

  def perform(klass1,klass2,*keys)
    klass1.constantize.find_each(:batch_size => 50) do |record1|

      attrs = keys.each_with_object({}) do |key,hsh| 
        hsh[key] = record1.send(key)
      end
      record2 = klass2.constantize.find_or_initialize_by(attrs)

      record2.attributes = record1.attributes

      if record2.changes.any?
        record2.save!
      end
    end
  end
end
