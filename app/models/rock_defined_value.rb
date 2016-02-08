# == Schema Information
#
# Table name: DefinedValue
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  DefinedTypeId           :integer          not null
#  Order                   :integer          not null
#  Value                   :string(100)      not null
#  Description             :text(2147483647)
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignKey              :string(100)
#  ForeignGuid             :uuid
#  ForeignId               :integer
#

class RockDefinedValue < RockBase
  self.primary_key = "Id"
  self.table_name = "DefinedValue"
  belongs_to :defined_type, class_name: "RockDefinedType", foreign_key: 'DefinedTypeId', primary_key: 'Id'
end
