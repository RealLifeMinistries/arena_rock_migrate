# == Schema Information
#
# Table name: rock_defined_types
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean
#  FieldTypeId             :integer
#  Order                   :integer
#  Name                    :string
#  Description             :string
#  Guid                    :uuid
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :integer
#  HelpText                :text
#  CategoryId              :integer
#

class RockDefinedType < ActiveRecord::Base
  self.primary_key = "Id"
  has_many :defined_values, class_name: "RockDefinedValue", foreign_key: 'DefinedTypeId', primary_key: 'Id'
end
