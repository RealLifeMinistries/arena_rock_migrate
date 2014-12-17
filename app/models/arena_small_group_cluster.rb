# == Schema Information
#
# Table name: arena_small_group_clusters
#
#  group_cluster_id      :integer          not null, primary key
#  date_created          :datetime
#  date_modified         :datetime
#  created_by            :string
#  modified_by           :string
#  organization_id       :integer
#  parent_cluster_id     :integer
#  leader_person_id      :integer
#  admin_person_id       :integer
#  cluster_name          :string
#  cluster_url           :string
#  cluster_desc          :string
#  cluster_notes         :string
#  foreign_region_key    :integer
#  foreign_subregion_key :integer
#  cluster_type_id       :integer
#  cluster_level         :integer
#  image_blob_id         :integer
#  area_id               :integer
#  active                :boolean
#  guid                  :uuid
#

class ArenaSmallGroupCluster < ActiveRecord::Base
  self.primary_key = :group_cluster_id
  belongs_to :parent, class: ArenaSmallGroupCluster, foreign_key: 'parent_cluster_id'
  belongs_to :leader, class: ArenaPerson, foreign_key: 'leader_person_id'
  belongs_to :admin, class: ArenaPerson, foreign_key: 'admin_person_id'
  belongs_to :area, class: ArenaArea

  has_many :groups, class: ArenaSmallGroup, foreign_key: 'group_cluster_id'
  has_many :child_clusters, class: self, foreign_key: :parent_cluster_id

  has_rock_mapping

  def sync_to_rock!
    map = mapping || build_mapping
    rock = map.rock_record ||= RockGroup.new

    rock.IsSystem ||= false
    rock.GroupTypeId ||= RockGroupType::SMALL_GROUP_CLUSTER
    rock.ParentGroupId = (parent ? parent.mapped_id : nil ) #RockGroup::HOME_GROUPS)
    rock.Name ||= cluster_name
    rock.Description ||= cluster_desc
    rock.IsSecurityRole ||= false
    rock.IsActive ||= active?
    rock.Order ||= 0
    rock.Guid ||= guid
    rock.CreatedDateTime ||= date_created
    rock.ModifiedDateTime ||= date_modified

    rock.save!
    map.save!
    sync_roles!
  end

  def sync_roles!
    rock_group = mapped_record
    if leader
      leader_role = RockGroupMember.find_or_initialize_by({
        GroupId: rock_group.Id,
        PersonId: leader_role.mapped_id,
        GroupRoleId: RockGroupTypeRole::SMALL_GROUP_CLUSTER_LEADER  
      })
      leader_role.IsSystem ||= false
      leader_role.GroupMemberStatus ||= RockGroupMemberStatus::ACTIVE
      leader_role.Guid ||= SecureRandom.uuid
      leader_role.save!
    end

    if admin
      admin_role = RockGroupMember.find_or_initialize_by({
        GroupId: rock_group.Id,
        PersonId: admin.mapped_id,
        GroupRoleId: RockGroupTypeRole::SMALL_GROUP_CLUSTER_LEADER  
      })
      admin_role.IsSystem ||= false
      admin_role.GroupMemberStatus ||= RockGroupMemberStatus::ACTIVE
      admin_role.Guid ||= SecureRandom.uuid
    end

  end

end
