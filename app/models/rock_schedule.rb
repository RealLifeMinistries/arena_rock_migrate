# == Schema Information
#
# Table name: Schedule
#
#  Id                        :integer          not null, primary key
#  Name                      :string(50)
#  Description               :text
#  iCalendarContent          :text
#  CheckInStartOffsetMinutes :integer
#  CheckInEndOffsetMinutes   :integer
#  EffectiveStartDate        :date
#  EffectiveEndDate          :date
#  CategoryId                :integer
#  Guid                      :uuid             not null
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  ForeignId                 :string(50)
#  WeeklyDayOfWeek           :integer
#  WeeklyTimeOfDay           :time
#

class RockSchedule < RockBase
  self.table_name = 'Schedule'
  self.primary_key = :Id

  has_arena_mapping

  SUNDAY = 0
  MONDAY = 1
  TUESDAY = 2
  WEDNESDAY = 3
  THURSDAY = 4
  FRIDAY = 5
  SATURDAY = 6
end
