# == Schema Information
#
# Table name: arena_occurrence_attendances_profiles
#
#  occurrence_id :integer          primary key
#  profile_id    :integer          primary key
#

class ArenaOccurrenceAttendanceProfile < ArenaBase
  self.primary_keys = :occurrence_id, :profile_id
  self.table_name = 'arena_occurrence_attendances_profiles'
end
