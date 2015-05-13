# == Schema Information
#
# Table name: rock_genders
#
#  id   :integer          not null, primary key
#  name :string           not null
#

class RockGender < ActiveRecord::Base

  has_one :mapping, as: :rock_record
  has_one :arena_record, through: :mapping
end
