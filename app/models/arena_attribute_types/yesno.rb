# == Schema Information
#
# Table name: arena_attribute_types
#
#  id   :integer          not null, primary key
#  name :string
#  type :string
#

class ArenaAttributeTypes::Yesno < ArenaAttributeType
  
  def handle_qualifiers_for!(attr)
    qualifiers = RockAttributeQualifier.where(AttributeId: attr.Id)

    unless qualifiers.select{|a| a.Key == 'truetext'}.any?
      create_truetext_qualifier_for(attr)
    end

    unless qualifiers.select{|a| a.Key == 'falsetext'}.any?
      create_falsetext_qualifier_for(attr)
    end

  end

  def set_rock_attribute_value(rock,arena)
    if arena.int_value == 0
      rock.Value = 'False'
    elsif arena.int_value > 0
      rock.Value = 'True'
    else
      throw(:skip_attribute)
    end
  end

  protected
  def create_truetext_qualifier_for(attr)
    RockAttributeQualifier.create!({
      Guid: SecureRandom.uuid, 
      IsSystem: false,
      AttributeId: attr.Id,
      Key: 'truetext',
      Value: 'Yes'
    })
  end

  def create_falsetext_qualifier_for(attr)
    RockAttributeQualifier.create!({
      Guid: SecureRandom.uuid, 
      IsSystem: false,
      AttributeId: attr.Id,
      Key: 'truetext',
      Value: 'No'
    })
  end
end
