# == Schema Information
#
# Table name: GroupTypeRole
#
#  Id                               :integer          not null, primary key
#  IsSystem                         :boolean          not null
#  GroupTypeId                      :integer          not null
#  Name                             :string(100)      not null
#  Description                      :text(2147483647)
#  Order                            :integer          not null
#  MaxCount                         :integer
#  MinCount                         :integer
#  IsLeader                         :boolean          not null
#  Guid                             :uuid             not null
#  CreatedDateTime                  :datetime
#  ModifiedDateTime                 :datetime
#  CreatedByPersonAliasId           :integer
#  ModifiedByPersonAliasId          :integer
#  ForeignKey                       :string(100)
#  CanView                          :boolean          default(FALSE), not null
#  CanEdit                          :boolean          default(FALSE), not null
#  ReceiveRequirementsNotifications :boolean          default(FALSE), not null
#  ForeignGuid                      :uuid
#  ForeignId                        :integer
#

class RockGroupTypeRole < RockBase
  self.primary_key = :Id
  self.table_name = 'GroupTypeRole'
  belongs_to :group_type, class_name: "RockGroupType", foreign_key: 'GroupTypeId', primary_key: 'Id'

  SMALL_GROUP_LEADER = 36
  SMALL_GROUP_MEMBER = 32
  SMALL_GROUP_CLUSTER_LEADER = 38
  SMALL_GROUP_CLUSTER_ADMIN = 39
end
