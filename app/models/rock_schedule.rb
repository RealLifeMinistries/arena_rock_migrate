# == Schema Information
#
# Table name: rock_schedules
#
#  Id                        :integer          not null, primary key
#  Name                      :string
#  Description               :string
#  iCalendarContent          :string
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
#  ForeignId                 :string
#

class RockSchedule < ActiveRecord::Base
  self.table_name = 'rock_schedules'
  self.primary_key = :Id

  has_arena_mapping
end
