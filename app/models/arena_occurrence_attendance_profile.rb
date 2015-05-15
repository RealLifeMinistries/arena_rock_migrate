class ArenaOccurrenceAttendanceProfile < ArenaBase
  self.primary_keys = :occurrence_id, :profile_id
  self.table_name = 'arena_occurrence_attendances_profiles'
end
