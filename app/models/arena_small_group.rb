# == Schema Information
#
# Table name: arena_small_groups
#
#  group_id                    :integer          not null, primary key
#  date_created                :datetime
#  date_modified               :datetime
#  created_by                  :string
#  modified_by                 :string
#  group_cluster_id            :integer
#  leader_person_id            :integer
#  group_name                  :string
#  group_url                   :string
#  group_desc                  :string
#  group_notes                 :string
#  max_members                 :integer
#  topic_luid                  :integer
#  meeting_day_luid            :integer
#  primary_age_luid            :integer
#  primary_marital_status_luid :integer          not null
#  foreign_key                 :integer
#  target_location_person_id   :integer
#  picture_url                 :string
#  schedule                    :string
#  group_type_luid             :integer
#  image_blob_id               :integer
#  guid                        :uuid
#  is_group_private            :boolean
#  active                      :boolean
#

class ArenaSmallGroup < ArenaBase
  self.primary_key = :group_id
  belongs_to :cluster, class: ArenaSmallGroupCluster, foreign_key: 'group_cluster_id'
  belongs_to :leader, class: ArenaPerson, foreign_key: 'leader_person_id'
  belongs_to :topic, class: ArenaLookup, foreign_key: 'topic_luid'
  belongs_to :meeting_day, class: ArenaLookup, foreign_key: 'meeting_day_luid'
  belongs_to :primary_age, class: ArenaLookup, foreign_key: 'primary_age_luid'
  belongs_to :primary_marital_status, class: ArenaLookup, foreign_key: 'primay_marital_status_luid'
  belongs_to :target_location_person, class: ArenaPerson
  belongs_to :group_type, class: ArenaLookup, foreign_key: 'group_type_luid'

  has_many :memberships, class: ArenaSmallGroupMember, foreign_key: 'group_id'
  has_many :members, through: :memberships, class: ArenaPerson, source: :person
  has_many :occurrence_instances, class: ArenaSmallGroupOccurrence, foreign_key: 'group_id'
  has_many :occurrences, through: :occurrence_instances, class: ArenaOccurrence
  has_rock_mapping

  def sync_to_rock!
    map = mapping || build_mapping
    rock = map.rock_record ||= RockGroup.new 

    rock.IsSystem ||= false
    rock.ParentGroupId ||= cluster.mapped_id
    rock.GroupTypeId ||= RockGroupType::SMALL_GROUP
    rock.Name ||= group_name
    rock.Description ||= group_desc
    rock.IsSecurityRole ||= false
    rock.IsActive ||= active?
    rock.Order ||= 0
    rock.Guid ||= guid
    rock.CreatedDateTime ||= date_created
    rock.ModifiedDateTime ||= date_modified
    
    rock.save!
    map.save!
    sync_roles!
    sync_memberships!
    sync_location!
  end

  def sync_roles!
    if leader
      rock_group = mapped_record
      leader_role = RockGroupMember.find_or_initialize_by({
        GroupId: rock_group.Id,
        PersonId: leader.mapped_id,
        GroupRoleId: RockGroupTypeRole::SMALL_GROUP_LEADER  
      })

      leader_role.IsSystem ||= false
      leader_role.GroupMemberStatus ||= RockGroupMemberStatus::ACTIVE
      leader_role.Guid ||= SecureRandom.uuid
       
      leader_role.save!
    end
  end

  def sync_memberships!
    memberships.each(&:sync_to_rock!)    
  end

  def sync_location!
    if address = primary_address
      rock_group = mapped_record

      gloc = RockGroupLocation.find_or_initialize_by({
          GroupId: rock_group.Id,
          GroupLocationTypeValueId: RockGroupLocation::MEETING_LOCATION_TYPE
      })

      gloc.location ||= RockLocation.new
      gloc.location.copy_arena_address(address)
      gloc.location.save

      gloc.Guid ||= SecureRandom.uuid
      gloc.IsMailingLocation ||= true
      gloc.IsMappedLocation ||= !!(address.Latitude && address.Latitude > 0)
      gloc.save!
    end
  end

  def primary_address
    if target_location_person
      return target_location_person.primary_address
    end
    return nil
  end
end
