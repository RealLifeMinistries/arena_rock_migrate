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

class Rock::DefinedType < Rock::Base
  self.primary_key = 'Id'
  self.table_name = 'DefinedType'
end
