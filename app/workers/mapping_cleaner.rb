class MappingCleaner
  include Sidekiq::Worker
  
  def perform(class_name)
    klass = class_name.constantize
    Mapping.where(rock_record_type: class_name).find_each do |m|
      cache_key = "mapping-#{class_name}-last-id"
      last_id = Rails.cache.read(cache_key) || 0

      if m.id > last_id
        unless klass.exists?(klass.primary_key => m.rock_record_id) 
          m.delete
        end

        Rails.cache.write cache_key, m.id
      end

    end
  end
end
