# == Schema Information
#
# Table name: rock_group_locations
#
#  Id                       :integer          not null, primary key
#  GroupId                  :integer          not null
#  LocationId               :integer          not null
#  GroupLocationTypeValueId :integer
#  IsMailingLocation        :boolean          not null
#  IsMappedLocation         :boolean          not null
#  Guid                     :uuid             not null
#  CreatedDateTime          :datetime
#  ModifiedDateTime         :datetime
#  CreatedByPersonAliasId   :integer
#  ModifiedByPersonAliasId  :integer
#  GroupMemberPersonAliasId :integer
#  ForeignId                :string
#

class RockGroupLocation < RockBase
  self.primary_key = :Id
  belongs_to :group, class: RockGroup, foreign_key: 'GroupId'
  belongs_to :location, class: RockLocation, foreign_key: 'LocationId'

  FAMILY_HOME_TYPE = 19
end
