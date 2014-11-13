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
#  DidAttend               :boolean          not null
#  Note                    :text
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string(50)
#  CampusId                :integer
#  PersonAliasId           :integer
#

class Rock::Attendance < Rock::Base
  self.table_name = "Attendance"
  self.primary_key = :Id
end
