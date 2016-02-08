# == Schema Information
#
# Table name: AttributeValue
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  AttributeId             :integer          not null
#  EntityId                :integer
#  Value                   :text(2147483647)
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignKey              :string(100)
#  ValueAsPersonId         :integer
#  ValueAsDateTime         :datetime
#  ValueAsNumeric          :decimal(38, 10)
#  ForeignGuid             :uuid
#  ForeignId               :integer
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
