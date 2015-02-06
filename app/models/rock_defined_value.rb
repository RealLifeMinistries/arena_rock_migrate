# == Schema Information
#
# Table name: rock_defined_values
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean
#  DefinedTypeId           :integer
#  Order                   :integer
#  Value                   :string
#  Description             :string
#  Guid                    :uuid
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string
#

class RockDefinedValue < RockBase
  self.primary_key = "Id"
  belongs_to :defined_type, class: RockDefinedType, foreign_key: 'DefinedTypeId', primary_key: 'Id'
end
