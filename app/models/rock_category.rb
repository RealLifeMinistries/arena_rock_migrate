# == Schema Information
#
# Table name: rock_categories
#
#  Id                        :integer          not null, primary key
#  IsSystem                  :boolean
#  ParentCategoryId          :integer
#  EntityTypeId              :integer
#  EntityTypeQualifierColumn :string
#  EntityTypeQualifierValue  :string
#  Name                      :string
#  IconCssClass              :string
#  Guid                      :uuid
#  Order                     :integer
#  Description               :string
#  CreatedDateTime           :datetime
#  ModifiedDateTime          :datetime
#  CreatedByPersonAliasId    :integer
#  ModifiedByPersonAliasId   :integer
#  ForeignId                 :integer
#  HighlightColor            :string
#

class RockCategory < RockBase
  self.primary_key = :Id
  belongs_to :entity_type, class: RockEntityType, foreign_key: 'EntityTypeId', primary_key: 'Id'
end
