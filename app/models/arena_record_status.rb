# == Schema Information
#
# Table name: arena_record_statuses
#
#  id   :integer          not null, primary key
#  name :string           not null
#

class ArenaRecordStatus < ArenaBase
  has_rock_mapping
end
