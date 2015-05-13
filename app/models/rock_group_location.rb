# == Schema Information
#
# Table name: GroupLocation
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
#  ForeignId                :string(50)
#  GroupMemberPersonAliasId :integer
#

class RockGroupLocation < RockBase
  self.primary_key = :Id
  self.table_name = 'GroupLocation'
  belongs_to :group, class: RockGroup, foreign_key: 'GroupId'
  belongs_to :location, class: RockLocation, foreign_key: 'LocationId'

  FAMILY_HOME_TYPE = 19
  MEETING_LOCATION_TYPE = 209
end
