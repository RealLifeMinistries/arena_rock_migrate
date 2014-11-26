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
  belongs_to :group, class: RockGroup, foreign_key: 'GroupId', primary_key: 'Id'
  belongs_to :person, class: RockPerson, foreign_key: 'PersonId', primary_key: 'Id'
  belongs_to :role, class: RockGroupTypeRole, foreign_key: 'GroupRoleId', primary_key: 'Id'
  belongs_to :status, class: RockGroupMemberStatus, foreign_key: 'GroupMemberStatus'  


end
