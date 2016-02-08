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
#  Key                       :string(1000)     not null
#  Name                      :string(1000)     not null
#  Description               :text(2147483647)
#  Order                     :integer          not null
#  IsGridColumn              :boolean          not null
#  DefaultValue              :text(2147483647)
#  IsMultiValue              :boolean          not null
#  IsRequired                :boolean          not null
#  Guid                      :uuid             not null
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  ForeignKey                :string(100)
#  IconCssClass              :string(100)
#  AllowSearch               :boolean          default(FALSE), not null
#  ForeignGuid               :uuid
#  ForeignId                 :integer
#

class RockAttribute < RockBase
  self.primary_key = :Id
  self.table_name = "Attribute"

  belongs_to :field_type, class_name: "RockFieldType", primary_key: 'Id', foreign_key: 'FieldTypeId'
  belongs_to :entity_type, class_name: "RockEntityType", primary_key: 'Id', foreign_key: 'EntityTypeId'
  has_many :category_assignments, class_name: "RockAttributeCategory", foreign_key: 'AttributeId'
  has_many :values, class_name: "RockAttributeValue", foreign_key: 'AttributeId'
  has_many :qualifiers, class_name: "RockAttributeQualifier", foreign_key: 'AttributeId'

  has_arena_mapping

  def categories
    category_assignments.includes(:category).collect(&:category).flatten
  end

  def in_category?(cat)
    categories.include?(cat)
  end
end
