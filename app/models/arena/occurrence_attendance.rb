# == Schema Information
#
# Table name: core_occurrence_attendance
#
#  occurrence_attendance_id :integer          not null, primary key
#  occurrence_id            :integer          not null
#  person_id                :integer
#  security_code            :varchar(6)       default(""), not null
#  attended                 :boolean          not null
#  check_in_time            :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  check_out_time           :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  notes                    :varchar(200)     not null
#  pager                    :varchar(50)      default(""), not null
#  session_id               :integer
#  type                     :integer          default(1), not null
#

class Arena::OccurrenceAttendance < Arena::Base
  self.primary_key = 'occurrence_attendance_id'
  self.table_name = 'core_occurrence_attendance'

end
