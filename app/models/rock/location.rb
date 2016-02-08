# == Schema Information
#
# Table name: Location
#
#  Id                              :integer          not null, primary key
#  ParentLocationId                :integer
#  Name                            :string(100)
#  IsActive                        :boolean          not null
#  LocationTypeValueId             :integer
#  GeoPoint                        :string
#  GeoFence                        :string
#  Street1                         :string(100)
#  Street2                         :string(100)
#  City                            :string(50)
#  State                           :string(50)
#  Country                         :string(50)
#  AssessorParcelId                :string(50)
#  StandardizeAttemptedDateTime    :datetime
#  StandardizeAttemptedServiceType :string(50)
#  StandardizeAttemptedResult      :string(50)
#  StandardizedDateTime            :datetime
#  GeocodeAttemptedDateTime        :datetime
#  GeocodeAttemptedServiceType     :string(50)
#  GeocodeAttemptedResult          :string(50)
#  GeocodedDateTime                :datetime
#  PrinterDeviceId                 :integer
#  Guid                            :uuid             not null
#  CreatedDateTime                 :datetime
#  ModifiedDateTime                :datetime
#  CreatedByPersonAliasId          :integer
#  ModifiedByPersonAliasId         :integer
#  IsGeoPointLocked                :boolean
#  ForeignKey                      :string(100)
#  ImageId                         :integer
#  PostalCode                      :string(50)
#  ForeignGuid                     :uuid
#  ForeignId                       :integer
#  County                          :string(50)
#

class Rock::Location < Rock::Base
  self.primary_key = :Id
  self.table_name = 'Location'
end
