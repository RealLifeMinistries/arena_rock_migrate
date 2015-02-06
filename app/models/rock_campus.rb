# == Schema Information
#
# Table name: rock_campus
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean
#  Name                    :string
#  ShortCode               :string
#  LocationId              :integer
#  Guid                    :uuid
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignId               :integer
#  PhoneNumber             :string
#  LeaderPersonAliasId     :integer
#  ServiceTimes            :string
#  Description             :string
#  IsActive                :boolean
#  Url                     :string
#

class RockCampus < RockBase
  self.primary_key = :Id
  belongs_to :location, class: RockLocation, foreign_key: 'LocationId', primary_key: 'Id'
end
