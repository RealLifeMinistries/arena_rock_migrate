# == Schema Information
#
# Table name: AttributeValue
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  AttributeId             :integer          not null
#  EntityId                :integer
#  Value                   :text(2147483647)
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignKey              :string(100)
#  ValueAsPersonId         :integer
#  ValueAsDateTime         :datetime
#  ValueAsNumeric          :decimal(38, 10)
#  ForeignGuid             :uuid
#  ForeignId               :integer
#

class RockAttributeValue < RockBase
  self.primary_key = :Id
  belongs_to :rock_attribute, class_name: "RockAttribute", foreign_key: 'AttributeId', primary_key: 'Id'
  self.table_name = 'AttributeValue'

  has_arena_mapping
  
end
