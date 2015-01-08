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
#

class Rock::Schedule < Rock::Base
  self.table_name = 'Schedule'
  self.primary_key = :Id
end
