class RockRecordSync
  include Sidekiq::Worker
  sidekiq_options queue: :rock, unique: true

  def perform(klass1,klass2,*keys)
    sync(klass2,klass1,*keys)
    sync(klass1,klass2,*keys)
  end

  def sync(klass1,klass2,*keys)
    if keys.size > 1
      klass1.constantize.find_each do |record1|
        attrs = keys.each_with_object({}) do |key,hsh| 
          hsh[key] = record1.send(key)
        end

        record2 = klass2.constantize.find_or_initialize_by(attrs)

        sync_instances(record1,record2)
      end
    else
      klass1.constantize.all.each do |record1|
        attrs = keys.each_with_object({}) do |key,hsh| 
          hsh[key] = record1.send(key)
        end

        record2 = klass2.constantize.find_or_initialize_by(attrs)

        sync_instances(record1,record2)
      end
    end
  end

  def sync_instances(record1,record2)
    if record2.persisted? && record2.respond_to?(:Guid)
      if record2.Guid.downcase != record1.Guid.downcase
        raise "Attribute Mismatch: #{record2.inspect} :::: #{record1.inspect}"
        return
      end
    end

    record2.attributes = record1.attributes

    if record2.changes.any?
      record2.save!
    end
  end

end
