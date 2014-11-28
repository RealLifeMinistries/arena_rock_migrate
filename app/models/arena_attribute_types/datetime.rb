# == Schema Information
#
# Table name: arena_attribute_types
#
#  id   :integer          not null, primary key
#  name :string
#  type :string
#

class ArenaAttributeTypes::Datetime < ArenaAttributeType

  def set_rock_attribute_value(rock,arena)
    rock.ValueAsDateTime = arena.datetime_value
    rock.Value = arena.datetime_value.try(:strftime,'%F')
  end

end
