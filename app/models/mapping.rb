# == Schema Information
#
# Table name: mappings
#
#  id                :integer          not null, primary key
#  arena_record_type :string           not null
#  arena_record_id   :integer          not null
#  rock_record_type  :string           not null
#  rock_record_id    :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#

class Mapping < ActiveRecord::Base
  belongs_to :rock_record, polymorphic: true
  belongs_to :arena_record, polymorphic: true
end
