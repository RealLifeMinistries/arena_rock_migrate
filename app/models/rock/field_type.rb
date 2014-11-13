# == Schema Information
#
# Table name: FieldType
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  Name                    :string(100)      not null
#  Description             :text
#  Assembly                :string(100)      not null
#  Class                   :string(100)      not null
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string(50)
#

class Rock::FieldType < Rock::Base
  self.primary_key = :Id
  self.table_name = "FieldType"
end
