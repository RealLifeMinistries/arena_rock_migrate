# == Schema Information
#
# Table name: arena_attribute_types
#
#  id   :integer          not null, primary key
#  name :string
#  type :string
#

class ArenaAttributeTypes::String < ArenaAttributeType

  def set_rock_attribute_value(rock,arena)
    if arena.varchar_value?
      rock.Value = arena.varchar_value
    else
      throw(:skip_attribute)
    end
  end
end
