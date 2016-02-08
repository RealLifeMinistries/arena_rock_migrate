# == Schema Information
#
# Table name: Group
#
#  Id                              :integer          not null, primary key
#  IsSystem                        :boolean          not null
#  ParentGroupId                   :integer
#  GroupTypeId                     :integer          not null
#  CampusId                        :integer
#  Name                            :string(100)      not null
#  Description                     :text(2147483647)
#  IsSecurityRole                  :boolean          not null
#  IsActive                        :boolean          not null
#  Order                           :integer          not null
#  Guid                            :uuid             not null
#  CreatedDateTime                 :datetime
#  ModifiedDateTime                :datetime
#  CreatedByPersonAliasId          :integer
#  ModifiedByPersonAliasId         :integer
#  ForeignKey                      :string(100)
#  AllowGuests                     :boolean
#  ScheduleId                      :integer
#  WelcomeSystemEmailId            :integer
#  ExitSystemEmailId               :integer
#  SyncDataViewId                  :integer
#  AddUserAccountsDuringSync       :boolean
#  MustMeetRequirementsToAddMember :boolean
#  IsPublic                        :boolean          default(TRUE), not null
#  ForeignGuid                     :uuid
#  ForeignId                       :integer
#

class RockGroup < RockBase
  self.primary_key = :Id
  self.table_name = 'Group'
  belongs_to :parent_group, class_name: "RockGroup", foreign_key: 'ParentGroupId', primary_key: 'Id'
  belongs_to :group_type, class_name: "RockGroupType", foreign_key: 'GroupTypeId', primary_key: 'Id'
  belongs_to :campus, class_name: "RockCampus", foreign_key: 'CampusId', primary_key: 'Id'
  belongs_to :schedule, class_name: "RockSchedule", foreign_key: 'ScheduleId', primary_key: 'Id'

  has_many :memberships, class_name: "RockGroupMember", foreign_key: 'GroupId', primary_key: 'Id', dependent: :destroy
  has_many :group_locations, class_name: "RockGroupLocation", foreign_key: 'GroupId', primary_key: 'Id'
  has_many :child_groups, class_name: "RockGroup", foreign_key: 'ParentGroupId', primary_key: 'Id', dependent: :nullify
  has_many :attendances, class_name: "RockAttendance", foreign_key: "GroupId", primary_key: 'Id'

  has_arena_mapping

  SMALL_GROUPS = 711
  SERVING_MINISTRY = 34241
  PARTICIPANT_MINISTRY = 34240
  EVENTS_CLASSES = 34239

end
