# == Schema Information
#
# Table name: arena_occurrence_attendances_small_groups
#
#  occurrence_id :integer          primary key
#  group_id      :integer          primary key
#

class ArenaOccurrenceAttendanceSmallGroup < ArenaBase
  self.primary_keys = :occurrence_id, :group_id
  self.table_name = 'arena_occurrence_attendances_small_groups'
  belongs_to :small_group, class_name: "ArenaSmallGroup", foreign_key: :group_id
end
