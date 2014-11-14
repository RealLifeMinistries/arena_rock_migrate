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
  belongs_to :parent_group, class: RockGroup, foreign_key: 'ParentGroupId', primary_key: 'Id'
  belongs_to :group_type, class: RockGroupType, foreign_key: 'GroupTypeId', primary_key: 'Id'
  belongs_to :campus, class: RockCampus, foreign_key: 'CampusId', primary_key: 'Id'

  has_one :mapping, as: :rock_record
  has_one :arena_record, through: :mapping
end
