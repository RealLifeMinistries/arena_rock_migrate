# == Schema Information
#
# Table name: AttributeQualifier
#
#  Id          :integer          not null, primary key
#  IsSystem    :boolean          not null
#  AttributeId :integer          not null
#  Key         :string(100)      not null
#  Value       :text
#  Guid        :uuid             not null
#  ForeignId   :string(50)
#

class RockAttributeQualifier < RockBase
  self.primary_key = :Id
  self.table_name = 'AttributeQualifier'

  belongs_to :rock_attribute, class: RockAttribute, foreign_key: 'AttributeId'
end
