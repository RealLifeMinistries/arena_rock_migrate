class MappingCleaner
  include Sidekiq::Worker
  
  def perform(class_name)
    klass = class_name.constantize
    Mapping.where(rock_record_type: class_name).find_each |m|
      unless klass.exists?(klass.primary_key => m.rock_record_id) 
        m.delete
      end
    end
  end
end
