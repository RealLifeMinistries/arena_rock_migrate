# == Schema Information
#
# Table name: rock_attribute_categories
#
#  AttributeId :integer          not null, primary key
#  CategoryId  :integer          not null, primary key
#

class RockAttributeCategory < ActiveRecord::Base
  self.primary_key = :AttributeId, :CategoryId
  belongs_to :rock_attribute, class: RockAttribute, foreign_key: 'AttributeId', primary_key: 'Id'
  belongs_to :category, class: RockCategory, foreign_key: 'CategoryId', primary_key: 'Id'
end
