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

class Rock::GroupType < Rock::Base
  self.table_name = 'GroupType'
  self.primary_key = :Id
end
