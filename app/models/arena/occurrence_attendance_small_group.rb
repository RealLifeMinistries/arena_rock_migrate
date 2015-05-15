class Arena::OccurrenceAttendanceSmallGroup < Arena::Base
  self.primary_keys = :occurrence_id, :group_id
  self.table_name = 'smgp_group_occurrence'
end
