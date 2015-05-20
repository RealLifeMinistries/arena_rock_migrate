# == Schema Information
#
# Table name: smgp_group_occurrence
#
#  group_id      :integer          not null, primary key
#  occurrence_id :integer          not null, primary key
#

class Arena::OccurrenceAttendanceSmallGroup < Arena::Base
  self.primary_keys = :occurrence_id, :group_id
  self.table_name = 'smgp_group_occurrence'
end
