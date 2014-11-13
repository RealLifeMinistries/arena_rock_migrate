# == Schema Information
#
# Table name: rock_group_members
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean
#  GroupId                 :integer
#  PersonId                :integer
#  GroupRoleId             :integer
#  GroupMemberStatus       :integer
#  Guid                    :uuid
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string
#  GuestCount              :integer
#

class RockGroupMember < ActiveRecord::Base
  self.primary_key = :Id
end
