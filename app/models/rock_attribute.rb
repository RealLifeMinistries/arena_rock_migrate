# == Schema Information
#
# Table name: rock_attributes
#
#  Id                        :integer          not null, primary key
#  IsSystem                  :boolean
#  FieldTypeId               :integer
#  EntityTypeId              :integer
#  EntityTypeQualifierColumn :string
#  EntityTypeQualifierValue  :string
#  Key                       :string
#  Name                      :string
#  Description               :string
#  Order                     :integer
#  IsGridColumn              :boolean
#  DefaultValue              :string
#  IsMultiValue              :boolean
#  IsRequired                :boolean
#  Guid                      :uuid
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  ForeignId                 :integer
#  IconCssClass              :string
#

class RockAttribute < ActiveRecord::Base
  self.primary_key = :Id

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
