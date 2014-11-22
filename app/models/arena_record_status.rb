# == Schema Information
#
# Table name: arena_record_statuses
#
#  id   :integer          not null, primary key
#  name :string           not null
#

class ArenaRecordStatus < ActiveRecord::Base
  has_rock_mapping
end
