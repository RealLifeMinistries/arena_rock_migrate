module Mappable
  def has_arena_mapping
    has_one :mapping, as: :rock_record, autosave: false
    define_method(:mapped_record) do
      unless mapping
        if respond_to?(:sync_to_arena!)
          sync_to_arena!
        end
      end
      if !mapping || !mapping.arena_record_id
        raise "No Mapping found for #{self.class.name}/#{self.send(self.class.primary_key)}"
      end
      mapping.arena_record
    end
    define_method(:mapped_id) do
      unless mapping
        if respond_to?(:sync_to_arena!)
          sync_to_arena!
        end
      end
      if !mapping || !mapping.arena_record_id
        raise "No Mapping found for #{self.class.name}/#{self.send(self.class.primary_key)}"
      end
      mapping.arena_record_id
    end
  end

  def has_rock_mapping
    has_one :mapping, as: :arena_record, autosave: false
    define_method(:mapped_record) do
      unless mapping
        if respond_to?(:sync_to_rock!)
          sync_to_rock!
        end
      end
      if !mapping || !mapping.rock_record_id
        raise "No Mapping found for #{self.class.name}/#{self.send(self.class.primary_key)}"
      end
      mapping.rock_record
    end
    define_method(:mapped_id) do
      unless mapping
        if respond_to?(:sync_to_rock!)
          sync_to_rock!
        end
      end
      if !mapping || !mapping.rock_record_id
        raise "No Mapping found for #{self.class.name}/#{self.send(self.class.primary_key)}"
      end
      mapping.rock_record_id
    end
  end

end
