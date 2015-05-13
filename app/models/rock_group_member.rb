# == Schema Information
#
# Table name: GroupMember
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  GroupId                 :integer          not null
#  PersonId                :integer          not null
#  GroupRoleId             :integer          not null
#  GroupMemberStatus       :integer          not null
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string(50)
#  GuestCount              :integer
#

class RockGroupMember < RockBase
  self.primary_key = :Id
  self.table_name = 'GroupMember'
  belongs_to :group, class: RockGroup, foreign_key: 'GroupId', primary_key: 'Id'
  belongs_to :person, class: RockPerson, foreign_key: 'PersonId', primary_key: 'Id'
  belongs_to :role, class: RockGroupTypeRole, foreign_key: 'GroupRoleId', primary_key: 'Id'
  belongs_to :status, class: RockGroupMemberStatus, foreign_key: 'GroupMemberStatus'  

  has_arena_mapping

end
