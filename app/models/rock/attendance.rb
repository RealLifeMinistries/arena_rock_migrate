# == Schema Information
#
# Table name: Attendance
#
#  Id                      :integer          not null, primary key
#  LocationId              :integer
#  ScheduleId              :integer
#  GroupId                 :integer
#  DeviceId                :integer
#  SearchTypeValueId       :integer
#  AttendanceCodeId        :integer
#  QualifierValueId        :integer
#  StartDateTime           :datetime         not null
#  EndDateTime             :datetime
#  DidAttend               :boolean
#  Note                    :text(2147483647)
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignKey              :string(100)
#  CampusId                :integer
#  PersonAliasId           :integer
#  RSVP                    :integer          default(0), not null
#  DidNotOccur             :boolean
#  Processed               :boolean
#  ForeignGuid             :uuid
#  ForeignId               :integer
#  SundayDate              :date
#

class Rock::Attendance < Rock::Base
  self.table_name = "Attendance"
  self.primary_key = :Id
end
