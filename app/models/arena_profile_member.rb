# == Schema Information
#
# Table name: arena_profile_members
#
#  profile_id    :integer          not null, primary key
#  person_id     :integer          not null, primary key
#  date_created  :datetime
#  date_modified :datetime
#  created_by    :string
#  modified_by   :string
#  source_luid   :integer
#  status_luid   :integer
#  notes         :string
#  date_pending  :datetime
#  date_inreview :datetime
#  date_active   :datetime
#  date_dormant  :datetime
#

class ArenaProfileMember < ArenaBase
  self.primary_key = :profile_id, :person_id
  belongs_to :person, class_name: "ArenaPerson"
  belongs_to :profile, class_name: "ArenaProfile"
  belongs_to :source, class_name: "ArenaLookup", foreign_key: :source_luid
  belongs_to :status, class_name: "ArenaLookup", foreign_key: :status_luid

  has_rock_mapping
  
  def sync_to_rock!
    if profile.mapping && person.mapping
      map = mapping || build_mapping
      rock = map.rock_record ||= RockGroupMember.new

      rock.IsSystem ||= false
      rock.Guid ||= SecureRandom.uuid
      rock.GroupMemberStatus = (status_luid == 316 ? RockGroupMemberStatus::INACTIVE : RockGroupMemberStatus::ACTIVE)
      rock.GroupId = profile.mapped_id
      rock.GroupRoleId = profile.mapped_record.group_type.DefaultGroupRoleId
      rock.PersonId = person.mapped_id
      
      rock.save!
      map.save!
    end
  end
end
