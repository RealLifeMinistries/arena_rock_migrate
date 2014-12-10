# == Schema Information
#
# Table name: rock_group_type_roles
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean
#  GroupTypeId             :integer
#  Name                    :string
#  Description             :string
#  Order                   :integer
#  MaxCount                :integer
#  MinCount                :integer
#  IsLeader                :integer
#  Guid                    :uuid
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string
#

class RockGroupTypeRole < ActiveRecord::Base
  self.primary_key = :Id
  belongs_to :group_type, class: RockGroupType, foreign_key: 'GroupTypeId', primary_key: 'Id'

  SMALL_GROUP_LEADER = 36
  SMALL_GROUP_MEMBER = 32
  SMALL_GROUP_CLUSTER_LEADER = 38
  SMALL_GROUP_CLUSTER_ADMIN = 39
end
