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

class RockGroupMember < RockBase
  self.primary_key = :Id
  self.table_name = 'GroupMember'
  belongs_to :group, class_name: "RockGroup", foreign_key: 'GroupId', primary_key: 'Id'
  belongs_to :person, class_name: "RockPerson", foreign_key: 'PersonId', primary_key: 'Id'
  belongs_to :role, class_name: "RockGroupTypeRole", foreign_key: 'GroupRoleId', primary_key: 'Id'
  belongs_to :status, class_name: "RockGroupMemberStatus", foreign_key: 'GroupMemberStatus'  

  has_arena_mapping

  def sync_to_rock!(only_new = true)
    @map = self.mapping || build_mapping
    @rock = @map.rock_record ||= RockGroupMember.new

    return if only_new && @rock.persisted? && @map.persisted?
  end
end
