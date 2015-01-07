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

class Rock::GroupLocation < Rock::Base
  self.table_name = 'GroupLocation'
  self.primary_key = :Id
end
