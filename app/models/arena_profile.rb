# == Schema Information
#
# Table name: arena_profiles
#
#  profile_id                  :integer          not null, primary key
#  date_created                :datetime
#  date_modified               :datetime
#  created_by                  :string
#  modified_by                 :string
#  profile_type                :integer
#  organization_id             :integer
#  department_id               :integer
#  parent_profile_id           :integer
#  owner_id                    :integer
#  profile_name                :string
#  profile_desc                :string
#  notes                       :string
#  active                      :boolean
#  display_order               :integer
#  foreign_key                 :string
#  category_level              :boolean
#  blob_id                     :integer
#  qualifier                   :integer
#  owner_relationship_strength :integer
#  peer_relationship_strength  :integer
#  guid                        :uuid
#  campus_id                   :integer
#

class ArenaProfile < ArenaBase
  self.primary_key = 'profile_id'

  belongs_to :profile_type_record, class: ArenaProfileType, foreign_key: :profile_type
  belongs_to :owner, class: ArenaPerson
  belongs_to :parent, class: ArenaProfile, foreign_key: :parent_profile_id

  has_many :memberships, class: ArenaProfileMember, foreign_key: :profile_id

  has_rock_mapping

  def sync_to_rock!
    if profile_type_record && profile_type_record.mapping # only sync if mapped type
      map = mapping || build_mapping
      rock = mapping.rock_record ||= RockGroup.new
      rock.Guid ||= (guid || SecureRandom.uuid)
      rock.IsSystem ||= false
      if parent_profile_id?
        rock.ParentGroupId = parent.mapped_id
      else
        rock.ParentGroupId = profile_type_record.default_rock_parent_group_id
      end
      rock.GroupTypeId = profile_type_record.mapped_id
      rock.Name = profile_name
      rock.Description = profile_desc
      rock.IsActive = active?
      rock.IsSecurityRole = false
      rock.Order = display_order || 0 
      rock.CreatedDateTime = date_created
      rock.ModifiedDateTime = date_modified 
      rock.save!
      map.save!
      # add owner to group
      #sync_members
    end
  end

  def sync_members
    memberships.each(&:sync_to_rock!)
  end

end
