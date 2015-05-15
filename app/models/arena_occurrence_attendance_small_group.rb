class ArenaOccurrenceAttendanceSmallGroup < ArenaBase
  self.primary_keys = :occurrence_id, :group_id
  self.table_name = 'arena_occurrence_attendances_small_groups'
end
