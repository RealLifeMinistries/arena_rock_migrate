# == Schema Information
#
# Table name: AttributeQualifier
#
#  Id          :integer          not null, primary key
#  IsSystem    :boolean          not null
#  AttributeId :integer          not null
#  Key         :string(100)      not null
#  Value       :text(2147483647)
#  Guid        :uuid             not null
#  ForeignKey  :string(100)
#  ForeignGuid :uuid
#  ForeignId   :integer
#

class RockAttributeQualifier < RockBase
  self.primary_key = :Id
  self.table_name = 'AttributeQualifier'

  belongs_to :rock_attribute, class_name: "RockAttribute", foreign_key: 'AttributeId'
end
