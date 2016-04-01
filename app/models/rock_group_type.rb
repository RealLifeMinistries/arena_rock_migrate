# == Schema Information
#
# Table name: GroupType
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  Name                    :string(100)      not null
#  Description             :text(2147483647)
#  GroupTerm               :string(100)      not null
#  GroupMemberTerm         :string(100)      not null
#  DefaultGroupRoleId      :integer
#  AllowMultipleLocations  :boolean          not null
#  ShowInGroupList         :boolean          not null
#  ShowInNavigation        :boolean          not null
#  IconCssClass            :string(100)
#  TakesAttendance         :boolean          not null
#  AttendanceRule          :integer          not null
#  AttendancePrintTo       :integer          not null
#  Order                   :integer          not null
#  InheritedGroupTypeId    :integer
#  LocationSelectionMode   :integer          not null
#  GroupTypePurposeValueId :integer
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignKey              :string(100)
#  EnableLocationSchedules :boolean
#  AllowedScheduleTypes    :integer          default(0), not null
#  SendAttendanceReminder  :boolean          default(FALSE), not null
#  IgnorePersonInactivated :boolean          default(FALSE), not null
#  ForeignGuid             :uuid
#  ForeignId               :integer
#  ShowConnectionStatus    :boolean          default(FALSE), not null
#

class RockGroupType < RockBase
  self.primary_key = :Id
  self.table_name = 'GroupType'
  belongs_to :purpose, class_name: "RockDefinedValue", foreign_key: 'GroupTypePurposeValueId', primary_key: 'Id'
  belongs_to :default_role, class_name: "RockGroupTypeRole", foreign_key: 'DefaultGroupRoleId', primary_key: 'Id'
  belongs_to :parent_group_type, class_name: "RockGroupType", foreign_key: 'InheritedGroupTypeId', primary_key: 'Id'

  FAMILY = 10
  SMALL_GROUP_CLUSTER = 33
  HOME_GROUP_ORG_UNIT = 41
  SMALL_GROUP = 27
  ATTENDANCE_SMALL_GROUP = 25
end
