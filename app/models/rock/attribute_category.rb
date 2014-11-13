# == Schema Information
#
# Table name: AttributeCategory
#
#  AttributeId :integer          not null, primary key
#  CategoryId  :integer          not null, primary key
#

class Rock::AttributeCategory < Rock::Base
  self.table_name = 'AttributeCategory'
  self.primary_key = :AttributeId, :CategoryId
end
