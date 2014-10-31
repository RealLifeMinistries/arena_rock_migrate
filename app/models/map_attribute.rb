# == Schema Information
#
# Table name: map_attributes
#
#  arena_attribute_id :integer          not null
#  rock_attribute_id  :integer          not null
#  id                 :integer          not null, primary key
#

class MapAttribute < ActiveRecord::Base
  belongs_to :rock_attribute
  belongs_to :arena_attribute
end
