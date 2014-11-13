# == Schema Information
#
# Table name: rock_attribute_categories
#
#  AttributeId :integer          not null, primary key
#  CategoryId  :integer          not null, primary key
#

class RockAttributeCategory < ActiveRecord::Base
  self.primary_key = :AttributeId, :CategoryId
end
