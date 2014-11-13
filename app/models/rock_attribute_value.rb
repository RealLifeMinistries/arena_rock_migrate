# == Schema Information
#
# Table name: rock_attribute_values
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean
#  AttributeId             :integer
#  EntityId                :integer
#  Value                   :string
#  Guid                    :uuid
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :string
#  ValueAsDateTime         :datetime
#  ValueAsNumeric          :decimal(38, 10)
#

class RockAttributeValue < ActiveRecord::Base
  self.primary_key = :Id
end
