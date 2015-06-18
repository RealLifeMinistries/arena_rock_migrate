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
    val = nil_if_1900 arena.datetime_value
    rock.Value = val.try(:strftime,'%F')
  end

end
