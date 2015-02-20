# == Schema Information
#
# Table name: arena_attribute_groups
#
#  attribute_group_id :integer          not null, primary key
#  guid               :uuid
#  date_created       :datetime
#  date_modified      :datetime
#  created_by         :string
#  modified_by        :string
#  organization_id    :integer
#  system_flag        :boolean
#  group_name         :string
#  group_order        :integer
#  display_location   :integer
#

class ArenaAttributeGroup < ArenaBase
  self.primary_key = 'attribute_group_id'

  has_rock_mapping

  def sync_to_rock!
    map = mapping || build_mapping
    rock = map.rock_record ||= RockCategory.new

    rock.IsSystem ||= false
    rock.EntityTypeId ||= RockEntityType::ATTRIBUTE
    rock.EntityTypeQualifierColumn ||= 'EntityTypeId'
    rock.EntityTypeQualifierValue ||= RockEntityType::PERSON
    rock.Name ||= group_name
    rock.Guid ||= SecureRandom.uuid 
    rock.Order ||= group_order
    rock.CreatedDateTime ||= date_created
    rock.ModifiedDateTime ||= date_modified

    rock.save!
    map.save!
  end
end
