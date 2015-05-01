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
#  ValueAsNumeric          :decimal(38, 10)
#  ValueAsPersonId         :integer
#  ValueAsDateTime         :datetime
#

class Rock::AttributeValue < Rock::Base
  self.primary_key = :Id
  self.table_name = 'AttributeValue'

  def ValueAsDateTime=d
    # computed in sql server
    d
  end

  def ValueAsNumeric=n
    # computed in sql server
    n
  end
end
