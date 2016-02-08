# == Schema Information
#
# Table name: Schedule
#
#  Id                        :integer          not null, primary key
#  Name                      :string(50)
#  Description               :text(2147483647)
#  iCalendarContent          :text(2147483647)
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
#  ForeignKey                :string(100)
#  WeeklyDayOfWeek           :integer
#  WeeklyTimeOfDay           :time
#  ForeignGuid               :uuid
#  ForeignId                 :integer
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
