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

class RockAttendance < RockBase
  self.primary_key = :Id
  self.table_name = "Attendance"
  has_arena_mapping

  belongs_to :location, class_name: "RockLocation", foreign_key: 'LocationId', primary_key: 'Id'
  belongs_to :campus, class_name: "RockCampus", foreign_key: 'CampusId', primary_key: 'Id'
  belongs_to :group, class_name: "RockGroup", foreign_key: 'GroupId', primary_key: 'Id'
  belongs_to :person_alias, class_name: "RockPersonAlias", foreign_key: 'PersonAliasId', primary_key: 'Id'

  WEEKEND_WORSHIP_SERVICE_GROUP = 34316
  CDA_WEEKEND_WORSHIP_SERVICE_GROUP = 37897
end
