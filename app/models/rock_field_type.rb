# == Schema Information
#
# Table name: rock_field_types
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean
#  Name                    :string
#  Description             :string
#  Assembly                :string
#  Class                   :string
#  Guid                    :uuid
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :integer
#

class RockFieldType < ActiveRecord::Base
  self.primary_key = "Id"
  
end
