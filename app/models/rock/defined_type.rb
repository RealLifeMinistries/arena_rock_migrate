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

class Rock::DefinedType < Rock::Base
  self.primary_key = 'Id'
  self.table_name = 'DefinedType'
end
