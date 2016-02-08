# == Schema Information
#
# Table name: Campus
#
#  Id                      :integer          not null, primary key
#  IsSystem                :boolean          not null
#  Name                    :string(100)      not null
#  ShortCode               :string(50)
#  LocationId              :integer
#  Guid                    :uuid             not null
#  CreatedDateTime         :datetime
#  ModifiedDateTime        :datetime
#  CreatedByPersonAliasId  :integer
#  ModifiedByPersonAliasId :integer
#  ForeignKey              :string(100)
#  PhoneNumber             :text(2147483647)
#  LeaderPersonAliasId     :integer
#  ServiceTimes            :string(500)
#  Description             :text(2147483647)
#  IsActive                :boolean
#  Url                     :text(2147483647)
#  ForeignGuid             :uuid
#  ForeignId               :integer
#

class RockCampus < RockBase
  self.primary_key = :Id
  self.table_name = "Campus"
  belongs_to :location, class_name: "RockLocation", foreign_key: 'LocationId', primary_key: 'Id'

  PF = 1
  CDA = 2
end
