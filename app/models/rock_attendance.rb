# == Schema Information
#
# Table name: rock_attendance
#
#  Id                      :integer          not null, primary key
#  LocationId              :integer
#  ScheduleId              :integer
#  GroupId                 :integer
#  DeviceId                :integer
#  SearchTypeValueId       :integer
#  AttendanceCodeId        :integer
#  QualifierValueId        :integer
#  StartDateTime           :datetime
#  EndDateTime             :datetime
#  DidAttend               :boolean
#  Note                    :string
#  Guid                    :uuid
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string
#  CampusId                :integer
#  PersonAliasId           :integer
#

class RockAttendance < RockBase
  self.primary_key = :Id
  self.table_name = 'rock_attendance'

  belongs_to :location, class: RockLocation, foreign_key: 'LocationId', primary_key: 'Id'
  belongs_to :campus, class: RockCampus, foreign_key: 'CampusId', primary_key: 'Id'
  belongs_to :group, class: RockGroup, foreign_key: 'GroupId', primary_key: 'Id'
  belongs_to :person_alias, class: RockPersonAlias, foreign_key: 'PersonAliasId', primary_key: 'Id'
end
