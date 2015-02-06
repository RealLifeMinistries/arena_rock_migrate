# == Schema Information
#
# Table name: rock_defined_types
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean
#  FieldTypeId             :integer
#  Order                   :integer
#  Name                    :string
#  Description             :string
#  Guid                    :uuid
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :integer
#  HelpText                :text
#  CategoryId              :integer
#

class RockDefinedType < RockBase
  self.primary_key = "Id"
  has_arena_mapping
  has_many :defined_values, class: RockDefinedValue, foreign_key: 'DefinedTypeId', primary_key: 'Id'
  belongs_to :field_type, class: RockFieldType, foreign_key: 'FieldTypeId', primary_key: 'Id'
  belongs_to :category, class: RockCategory, foreign_key: 'CategoryId', primary_key: 'Id'
end
