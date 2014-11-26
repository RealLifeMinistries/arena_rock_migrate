# == Schema Information
#
# Table name: arena_family_members
#
#  family_id     :integer          not null, primary key
#  person_id     :integer          not null, primary key
#  date_created  :datetime
#  date_modified :datetime
#  created_by    :string
#  modified_by   :string
#  role_luid     :integer
#

class ArenaFamilyMember < ActiveRecord::Base
  self.primary_keys = :family_id, :person_id

  belongs_to :person, class: ArenaPerson
  belongs_to :family, class: ArenaFamily
  belongs_to :role, class: ArenaLookup, foreign_key: :role_luid

  has_rock_mapping

  def sync_to_rock!
    map = mapping || build_mapping
    rock = map.rock_record ||= RockGroupMember.new

    rock.IsSystem = false
    rock.GroupId = family.mapped_id
    rock.PersonId = person.mapped_id
    rock.GroupRoleId = group_role_mapped_id 
    rock.GroupMemberStatus = RockGroupMemberStatus::ACTIVE
    rock.CreatedDateTime = date_created
    rock.ModifiedDateTime = date_modified

    rock.Guid ||= SecureRandom.uuid()
    
    rock.save!
    self.mapping = map
    map.save!
  end

  def group_role_mapped_id
    unless role.mapping
      rock = RockGroupTypeRole.new
      rock.GroupTypeId = RockGroupType::FAMILY
      rock.IsSystem = false 
      rock.Name = role.lookup_value
      rock.Guid = role.guid
      rock.save!
      role.mapping = Mapping.new(rock_record: rock)
      role.mapping.save!
    end
    return role.mapping.rock_record_id
  end

end
