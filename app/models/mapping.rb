# == Schema Information
#
# Table name: mappings
#
#  id                :integer          not null, primary key
#  arena_record_type :string
#  arena_record_id   :integer
#  rock_record_type  :string
#  rock_record_id    :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Mapping < ActiveRecord::Base
  belongs_to :rock_record, polymorphic: true
  belongs_to :arena_record, polymorphic: true
end
