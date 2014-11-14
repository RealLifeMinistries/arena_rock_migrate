# == Schema Information
#
# Table name: rock_locations
#
#  Id                              :integer          not null, primary key
#  ParentLocationId                :integer
#  Name                            :string
#  IsActive                        :boolean
#  LocationTypeValueId             :integer
#  GeoPoint                        :binary
#  GeoFence                        :binary
#  Street1                         :string
#  Street2                         :string
#  City                            :string
#  State                           :string
#  Country                         :string
#  AssessorParcelId                :string
#  StandardizeAttemptedDateTime    :datetime
#  StandardizeAttemptedServiceType :string
#  StandardizeAttemptedResult      :string
#  StandardizedDateTime            :datetime
#  GeocodeAttemptedDateTime        :datetime
#  GeocodeAttemptedServiceType     :string
#  GeocodeAttemptedResult          :string
#  GeocodedDateTime                :datetime
#  PrinterDeviceId                 :integer
#  Guid                            :uuid
#  CreatedDateTime                 :datetime
#  ModifiedDateTime                :datetime
#  CreatedByPersonAliasId          :integer
#  ModifiedByPersonAliasId         :integer
#  IsGeoPointLocked                :boolean
#  ForeignId                       :string
#  ImageId                         :integer
#  PostalCode                      :string
#

class RockLocation < ActiveRecord::Base
  self.primary_key = :Id
  belongs_to :parent_location, class: RockLocation, foreign_key: 'ParentLocationId', primary_key: 'Id'
  belongs_to :location_type, class: RockDefinedValue, foreign_key: 'LocationTypeValueId', primary_key: 'Id'

  has_one :mapping, as: :rock_record
  has_one :arena_record, through: :mapping
end
