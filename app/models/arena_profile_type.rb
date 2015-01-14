# == Schema Information
#
# Table name: arena_profile_types
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class ArenaProfileType < ActiveRecord::Base

  has_rock_mapping
end
