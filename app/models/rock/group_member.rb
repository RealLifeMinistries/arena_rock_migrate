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
#  ForeignKey              :string(100)
#  GuestCount              :integer
#  DateTimeAdded           :datetime
#  IsNotified              :boolean          default(FALSE), not null
#  Note                    :text(2147483647)
#  ForeignGuid             :uuid
#  ForeignId               :integer
#

class Rock::GroupMember < Rock::Base
  self.table_name = 'GroupMember'
  self.primary_key = :Id
end
