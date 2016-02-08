# == Schema Information
#
# Table name: core_occurrence_attendance
#
#  occurrence_attendance_id :integer          not null, primary key
#  occurrence_id            :integer          not null
#  person_id                :integer
#  security_code            :varchar(6)       not null
#  attended                 :boolean          not null
#  check_in_time            :datetime         not null
#  check_out_time           :datetime         not null
#  notes                    :varchar(200)     not null
#  pager                    :varchar(50)      not null
#  session_id               :integer
#  type                     :integer          not null
#

class Arena::OccurrenceAttendance < Arena::Base
  self.primary_key = 'occurrence_attendance_id'
  self.table_name = 'core_occurrence_attendance'

end
