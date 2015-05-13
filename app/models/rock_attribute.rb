# == Schema Information
#
# Table name: Attribute
#
#  Id                        :integer          not null, primary key
#  IsSystem                  :boolean          not null
#  FieldTypeId               :integer          not null
#  EntityTypeId              :integer
#  EntityTypeQualifierColumn :string(50)
#  EntityTypeQualifierValue  :string(200)
#  Key                       :string(200)      not null
#  Name                      :string(100)      not null
#  Description               :text
#  Order                     :integer          not null
#  IsGridColumn              :boolean          not null
#  DefaultValue              :text
#  IsMultiValue              :boolean          not null
#  IsRequired                :boolean          not null
#  Guid                      :uuid             not null
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  ForeignId                 :string(50)
#  IconCssClass              :text
#

class RockAttribute < RockBase
  self.primary_key = :Id
  self.table_name = "Attribute"

  belongs_to :field_type, class: RockFieldType, primary_key: 'Id', foreign_key: 'FieldTypeId'
  belongs_to :entity_type, class: RockEntityType, primary_key: 'Id', foreign_key: 'EntityTypeId'
  has_many :category_assignments, class: RockAttributeCategory, foreign_key: 'AttributeId'

  has_many :qualifiers, class: RockAttributeQualifier, foreign_key: 'AttributeId'

  has_arena_mapping

  def categories
    category_assignments.includes(:category).collect(&:category).flatten
  end

  def in_category?(cat)
    categories.include?(cat)
  end
end
