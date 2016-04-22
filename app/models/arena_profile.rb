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

  belongs_to :profile_type_record, class_name: "ArenaProfileType", foreign_key: :profile_type
  belongs_to :owner, class_name: "ArenaPerson"
  belongs_to :parent, class_name: "ArenaProfile", foreign_key: :parent_profile_id

  has_many :memberships, class_name: "ArenaProfileMember", foreign_key: :profile_id

  has_rock_mapping

  def sync_to_rock!
    if profile_type_record && profile_type_record.mapping # only sync if mapped type
      @map = mapping || build_mapping
      @rock = mapping.rock_record ||= RockGroup.new
      @rock.Guid ||= (guid || SecureRandom.uuid)
      @rock.IsSystem ||= false
      if parent_profile_id?
        @rock.ParentGroupId ||= parent.mapped_id
      else
        @rock.ParentGroupId ||= default_rock_parent_group_id
      end
      @rock.GroupTypeId ||= get_group_type_id#profile_type_record.mapping.#profile_type_record.mapped_id
      @rock.Name ||= profile_name
      @rock.Description ||= profile_desc
      @rock.IsActive ||= active?
      @rock.IsSecurityRole ||= false
      @rock.Order ||= display_order || 0
      @rock.CreatedDateTime ||= date_created
      @rock.ModifiedDateTime ||= date_modified
      @rock.save!
      @map.save!
      # add owner to group
      #sync_members
    end
  end
  
  def get_group_type_id
    case profile_type_record.id
      when ArenaProfileType::PARTICIPANT
        return RockGroupType::PARTICIPANT_MINISTRY
      when ArenaProfileType::SERVING
        return RockGroupType::SERVING
      when ArenaProfileType::CLASSES_EVENTS
        if [3258, 3075, 1282, 1676, 2428, 2801, 2862, 2772, 1279, 1378, 2824, 1149, 1779, 1843, 2460, 1462, 1406, 3311, 1886, 1833, 3226, 1456, 1831, 1700, 3041, 1464, 1283, 1674, 1412, 1448, 1626, 3152, 3044].include? parent_profile_id
          return RockGroupType::CLASS
        end
        if [1281, 2695, 1731, 1421, 2554, 2643, 2241, 1556, 2251, 1973, 2966, 1946, 3022, 1679, 1753].include? parent_profile_id
          return RockGroupType::EVENT
        end
      else
        return nil
    end
  end
  def default_rock_parent_group_id
    case profile_type_record.id
      when ArenaProfileType::PARTICIPANT
        return RockGroup::PARTICIPANT_MINISTRY
      when ArenaProfileType::SERVING
        return RockGroup::SERVING_MINISTRY
      when ArenaProfileType::CLASSES_EVENTS
        if [3258, 3075, 1282, 1676, 2428, 2801, 2862, 2772, 1279, 1378, 2824, 1149, 1779, 1843, 2460, 1462, 1406, 3311, 1886, 1833, 3226, 1456, 1831, 1700, 3041, 1464, 1283, 1674, 1412, 1448, 1626, 3152, 3044].include? id
          return RockGroup::CLASSES
        end
        if [1281, 2695, 1731, 1421, 2554, 2643, 2241, 1556, 2251, 1973, 2966, 1946, 3022, 1679, 1753].include? id
          return RockGroup::EVENTS
        end
      else
        nil
    end
  end

  def sync_members
    memberships.each(&:sync_to_rock!)
  end

end
