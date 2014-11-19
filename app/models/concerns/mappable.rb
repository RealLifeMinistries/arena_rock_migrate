module Mappable
  def has_arena_mapping
    has_one :mapping, as: :rock_record
    define_method(:arena_record) do
      mapping && mapping.arena_record
    end
  end

  def has_rock_mapping
    has_one :mapping, as: :arena_record
    define_method(:rock_record) do
      mapping && mapping.rock_record
    end
  end
end
