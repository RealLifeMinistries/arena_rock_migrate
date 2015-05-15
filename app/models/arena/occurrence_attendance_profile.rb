class Arena::OccurrenceAttendanceProfile < Arena::Base
  self.primary_keys = :occurrence_id, :profile_id
  self.table_name = 'core_profile_occurrence'
end
