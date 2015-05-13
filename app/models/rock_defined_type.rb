# == Schema Information
#
# Table name: DefinedType
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  FieldTypeId             :integer
#  Order                   :integer          not null
#  Name                    :string(100)      not null
#  Description             :text
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string(50)
#  HelpText                :text
#  CategoryId              :integer
#

class RockDefinedType < RockBase
  self.table_name = 'DefinedType'
  self.primary_key = "Id"
  has_arena_mapping
  has_many :defined_values, class: RockDefinedValue, foreign_key: 'DefinedTypeId', primary_key: 'Id'
  belongs_to :field_type, class: RockFieldType, foreign_key: 'FieldTypeId', primary_key: 'Id'
  belongs_to :category, class: RockCategory, foreign_key: 'CategoryId', primary_key: 'Id'
end
