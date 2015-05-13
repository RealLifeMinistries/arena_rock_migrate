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
#  Note                    :text
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string(50)
#  CampusId                :integer
#  PersonAliasId           :integer
#  RSVP                    :integer          default(0), not null
#  DidNotOccur             :boolean
#  Processed               :boolean
#

class RockAttendance < RockBase
  self.primary_key = :Id
  self.table_name = "Attendance"

  belongs_to :location, class: RockLocation, foreign_key: 'LocationId', primary_key: 'Id'
  belongs_to :campus, class: RockCampus, foreign_key: 'CampusId', primary_key: 'Id'
  belongs_to :group, class: RockGroup, foreign_key: 'GroupId', primary_key: 'Id'
  belongs_to :person_alias, class: RockPersonAlias, foreign_key: 'PersonAliasId', primary_key: 'Id'
end
