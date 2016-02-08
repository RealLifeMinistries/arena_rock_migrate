# == Schema Information
#
# Table name: FieldType
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  Name                    :string(100)      not null
#  Description             :text(2147483647)
#  Assembly                :string(100)      not null
#  Class                   :string(100)      not null
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignKey              :string(100)
#  ForeignGuid             :uuid
#  ForeignId               :integer
#

class Rock::FieldType < Rock::Base
  self.primary_key = :Id
  self.table_name = "FieldType"
end
