# == Schema Information
#
# Table name: GroupType
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  Name                    :string(100)      not null
#  Description             :text
#  GroupTerm               :string(100)      not null
#  GroupMemberTerm         :string(100)      not null
#  DefaultGroupRoleId      :integer
#  AllowMultipleLocations  :boolean          not null
#  ShowInGroupList         :boolean          not null
#  ShowInNavigation        :boolean          not null
#  IconCssClass            :text
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
#  ForeignId               :string(50)
#  EnableLocationSchedules :boolean
#  AllowedScheduleTypes    :integer          default(0), not null
#  SendAttendanceReminder  :boolean          default(FALSE), not null
#

class RockGroupType < RockBase
  self.primary_key = :Id
  self.table_name = 'GroupType'
  belongs_to :purpose, class: RockDefinedValue, foreign_key: 'GroupTypePurposeValueId', primary_key: 'Id'
  belongs_to :default_role, class: RockGroupTypeRole, foreign_key: 'DefaultGroupRoleId', primary_key: 'Id'
  belongs_to :parent_group_type, class: RockGroupType, foreign_key: 'InheritedGroupTypeId', primary_key: 'Id'

  FAMILY = 10
  SMALL_GROUP_CLUSTER = 33
  SMALL_GROUP = 27
end
