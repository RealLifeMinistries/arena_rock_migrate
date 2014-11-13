# == Schema Information
#
# Table name: rock_groups
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean
#  ParentGroupId           :integer
#  GroupTypeId             :integer
#  CampusId                :integer
#  Name                    :string
#  Description             :string
#  IsSecurityRole          :boolean
#  IsActive                :boolean
#  Order                   :integer
#  Guid                    :uuid
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :integer
#  AllowGuests             :boolean
#

class RockGroup < ActiveRecord::Base
  self.primary_key = :Id
end
