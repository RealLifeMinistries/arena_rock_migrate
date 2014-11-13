# == Schema Information
#
# Table name: arena_occurrence_attendance
#
#  occurrence_attendance_id :integer          not null, primary key
#  occurrence_id            :integer
#  person_id                :integer
#  security_code            :string
#  attended                 :boolean
#  check_in_time            :datetime
#  check_out_time           :datetime
#  notes                    :string
#  pager                    :string
#  session_id               :integer
#  type                     :integer
#

class ArenaOccurrenceAttendance < ActiveRecord::Base
  self.primary_key = 'occurrence_attendance_id'
  self.table_name = 'arena_occurrence_attendance'

  def self.inheritance_column
    nil
  end
end
