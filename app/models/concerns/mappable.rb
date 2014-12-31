module Mappable
  def has_arena_mapping
    define_method(:mapping) do
      @mapping ||=
      Mapping.find_by({
        rock_record_type: self.class.name, 
        rock_record_id: self.to_param 
      })
    end
    define_method(:mapping=) do |map|
      if mapping && (mapping != map)
        mapping.destroy!
      end 
      @mapping = map
    end
    define_method(:build_mapping) do
      self.mapping =
        Mapping.new({
          rock_record_type: self.class.name, 
          rock_record_id: self.to_param 
        })
    end
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
    define_method(:mapping) do
      @mapping ||=
      Mapping.find_by({
        arena_record_type: self.class.name, 
        arena_record_id: self.to_param 
      })
    end
    define_method(:mapping=) do |map|
      if mapping && (mapping != map)
        mapping.destroy!
      end 
      @mapping = map
    end
    define_method(:build_mapping) do
      self.mapping =
        Mapping.new({
          arena_record_type: self.class.name, 
          arena_record_id: self.to_param 
        })
    end
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
