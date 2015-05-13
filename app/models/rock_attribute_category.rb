# == Schema Information
#
# Table name: AttributeCategory
#
#  AttributeId :integer          not null, primary key
#  CategoryId  :integer          not null, primary key
#

class RockAttributeCategory < RockBase
  self.primary_key = :AttributeId, :CategoryId
  self.table_name = 'AttributeCategory'
  belongs_to :rock_attribute, class: RockAttribute, foreign_key: 'AttributeId', primary_key: 'Id'
  belongs_to :category, class: RockCategory, foreign_key: 'CategoryId', primary_key: 'Id'
end
