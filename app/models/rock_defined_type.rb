# == Schema Information
#
# Table name: DefinedType
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  FieldTypeId             :integer
#  Order                   :integer          not null
#  Name                    :string(100)      not null
#  Description             :text(2147483647)
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignKey              :string(100)
#  HelpText                :text(2147483647)
#  CategoryId              :integer
#  ForeignGuid             :uuid
#  ForeignId               :integer
#

class RockDefinedType < RockBase
  self.table_name = 'DefinedType'
  self.primary_key = "Id"
  has_arena_mapping
  has_many :defined_values, class_name: "RockDefinedValue", foreign_key: 'DefinedTypeId', primary_key: 'Id'
  belongs_to :field_type, class_name: "RockFieldType", foreign_key: 'FieldTypeId', primary_key: 'Id'
  belongs_to :category, class_name: "RockCategory", foreign_key: 'CategoryId', primary_key: 'Id'
end
