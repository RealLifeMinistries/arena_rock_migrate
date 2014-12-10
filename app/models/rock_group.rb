# == Schema Information
#
# Table name: rock_groups
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  ParentGroupId           :integer
#  GroupTypeId             :integer          not null
#  CampusId                :integer
#  Name                    :string           not null
#  Description             :string
#  IsSecurityRole          :boolean          not null
#  IsActive                :boolean          not null
#  Order                   :integer          not null
#  Guid                    :uuid             not null
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
  
  has_many :memberships, class: RockGroupMember, foreign_key: 'GroupId', primary_key: 'Id'

  has_arena_mapping

  HOME_GROUPS = 711
end
