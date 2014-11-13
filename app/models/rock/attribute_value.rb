# == Schema Information
#
# Table name: AttributeValue
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  AttributeId             :integer          not null
#  EntityId                :integer
#  Value                   :text
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string(50)
#  ValueAsDateTime         :datetime
#  ValueAsNumeric          :decimal(38, 10)
#

class Rock::AttributeValue < Rock::Base
  self.primary_key = :Id
  self.table_name = 'AttributeValue'
end
