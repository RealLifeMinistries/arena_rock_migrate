# == Schema Information
#
# Table name: rock_group_types
#
#  Id                      :integer          not null, primary key
#  IsSystem                :integer
#  Name                    :string
#  Description             :string
#  GroupTerm               :string
#  GroupMemberTerm         :string
#  DefaultGroupRoleId      :integer
#  AllowMultipleLocations  :boolean
#  ShowInGroupList         :boolean
#  ShowInNavigation        :boolean
#  IconCssClass            :string
#  TakesAttendance         :boolean
#  AttendanceRule          :integer
#  AttendancePrintTo       :integer
#  Order                   :integer
#  InheritedGroupTypeId    :integer
#  LocationSelectionMode   :integer
#  GroupTypePurposeValueId :integer
#  Guid                    :uuid
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string
#  EnableLocationSchedules :boolean
#

class RockGroupType < ActiveRecord::Base
  self.primary_key = :Id
  belongs_to :purpose, class: RockDefinedValue, foreign_key: 'GroupTypePurposeValueId', primary_key: 'Id'
  belongs_to :default_role, class: RockGroupTypeRole, foreign_key: 'DefaultGroupRoleId', primary_key: 'Id'
  belongs_to :parent_group_type, class: RockGroupType, foreign_key: 'InheritedGroupTypeId', primary_key: 'Id'

  FAMILY = 10
end
