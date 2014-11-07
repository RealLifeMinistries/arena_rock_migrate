class ArenaOccurrenceAttendance < ActiveRecord::Base
  self.primary_key = 'occurrence_attendance_id'
  self.table_name = 'arena_occurrence_attendance'
end
