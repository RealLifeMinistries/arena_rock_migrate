# == Schema Information
#
# Table name: arena_attributes
#
#  attribute_id       :integer          not null, primary key
#  guid               :uuid
#  date_created       :datetime
#  date_modified      :datetime
#  created_by         :string
#  modified_by        :string
#  attribute_group_id :integer
#  attribute_name     :string
#  attribute_type     :integer
#  attribute_order    :integer
#  visible            :boolean
#  required           :boolean
#  type_qualifier     :string
#  readonly           :boolean
#  system_flag        :boolean
#

class ArenaAttribute < ActiveRecord::Base
  self.primary_key = 'attribute_id'
  belongs_to :attribute_group, class: ArenaAttributeGroup
  belongs_to :attribute_type_record, class: ArenaAttributeType, foreign_key: :attribute_type
  belongs_to :qualifier, class: ArenaLookupType, foreign_key: :type_qualifier

  has_rock_mapping

  def sync_to_rock!
    unless does_not_transfer?
      map = mapping || build_mapping
      rock = map.rock_record ||= RockAttribute.new
      rock.FieldTypeId = attribute_type_record.mapped_id
      rock.IsSystem ||= false
      rock.EntityTypeId = RockEntityType::PERSON 
      rock.EntityTypeQualifierColumn = ""
      rock.EntityTypeQualifierId = ""
      rock.Name ||= attribute_name
      rock.Key ||= key
      rock.Order ||= attribute_order
      rock.IsGridColumn ||= false
      rock.IsMultiValue ||= false
      rock.IsRequired ||= required?
      rock.Guid ||= SecureRandom.uuid
      rock.CreatedDateTime ||= date_created
      rock.ModifiedDateTime ||= date_modified
      rock.save!
      map.save!

      sync_attribute_group!
      attribute_type_record.handle_qualifiers_for!(rock)
    end
  end

  def sync_attribute_group!
    attribute_group.sync_to_rock! 
    rock_attr_category = attribute_group.mapped_record

    unless mapped_record.in_category?(rock_attr_category)
      RockAttributeCategory.create!(
        rock_attribute: mapped_record, 
        category: rock_attr_category
      )
    end 
  end

  def key
    ActionView::Base.full_sanitizer.sanitize(attribute_name).gsub(/[^a-zA-Z0-9\s]/,'').strip.gsub(/[\s]+/,'_').camelize
  end

  def does_not_transfer?
    # read only attributes, and documents are not transfering
    attribute_type_record.is_a?(ArenaAttributeTypes::Readonly) ||
    attribute_type_record.is_a?(ArenaAttributeTypes::Document)
  end

  def set_rock_value(rock,arena)
    attribute_type_record.set_rock_attribute_value(rock,arena)
  end

end
