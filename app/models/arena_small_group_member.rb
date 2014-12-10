# == Schema Information
#
# Table name: arena_small_group_members
#
#  group_id       :integer          not null, primary key
#  person_id      :integer          not null, primary key
#  date_created   :datetime
#  date_modified  :datetime
#  created_by     :string
#  modified_by    :string
#  role_luid      :integer
#  date_joined    :datetime
#  notes          :string
#  uniform_number :integer
#  active         :boolean
#

class ArenaSmallGroupMember < ActiveRecord::Base
  self.primary_key = :group_id,:person_id
  belongs_to :group, class: ArenaSmallGroup
  belongs_to :person, class: ArenaPerson
  belongs_to :role, class: ArenaLookup, foreign_key: 'role_luid'

  has_rock_mapping

  def sync_to_rock!
    map = mapping || build_mapping
    rock = map.rock_record ||= RockGroupMember.new
    
    rock.IsSystem ||= false
    rock.Guid ||= SecureRandom.uuid
    rock.GroupMemberStatus ||= (active? ? RockGroupMemberStatus::ACTIVE : RockGroupMemberStatus::INACTIVE)
    rock.GroupId = group.mapped_id
    rock.PersonId = person.mapped_id
    rock.GroupRoleId = role.mapped_id

    rock.save!
    map.save!

  end
end
