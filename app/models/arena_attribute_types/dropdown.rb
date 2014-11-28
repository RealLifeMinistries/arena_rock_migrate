# == Schema Information
#
# Table name: arena_attribute_types
#
#  id   :integer          not null, primary key
#  name :string
#  type :string
#

class ArenaAttributeTypes::Dropdown < ArenaAttributeType

  def handle_qualifiers_for!(attr)
    unless attr.qualifiers.select{|a| a.Key == 'definedtype'}.any?
      create_definedtype_qualifier_for(attr)
    end

    unless attr.qualifiers.select{|a| a.Key == 'allowmultiple'}.any?
      create_allowmultiple_qualifier_for(attr)
    end
  end

  protected
  def create_definedtype_qualifier_for(attr)
    RockAttributeQualifier.create!({
      Guid: SecureRandom.uuid, 
      IsSystem: false,
      AttributeId: attr.Id,
      Key: 'definedtype',
      Value: attr.mapped_record.qualifier.mapped_id 
    })
  end

  def create_allowmultiple_qualifier_for(attr)
    RockAttributeQualifier.create!({
      Guid: SecureRandom.uuid, 
      IsSystem: false,
      AttributeId: attr.Id,
      Key: 'allowmultiple',
      Value: 'False'
    })
  end

end
