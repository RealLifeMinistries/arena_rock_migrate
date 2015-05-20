# == Schema Information
#
# Table name: Location
#
#  Id                              :integer          not null, primary key
#  ParentLocationId                :integer
#  Name                            :string(100)
#  IsActive                        :boolean          not null
#  LocationTypeValueId             :integer
#  GeoPoint                        :geography
#  GeoFence                        :geography
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
#  ForeignId                       :string(50)
#  ImageId                         :integer
#  PostalCode                      :string(50)
#

class RockLocation < RockBase
  self.primary_key = :Id
  self.table_name = 'Location'
  belongs_to :parent_location, class: RockLocation, foreign_key: 'ParentLocationId', primary_key: 'Id'
  belongs_to :location_type, class: RockDefinedValue, foreign_key: 'LocationTypeValueId', primary_key: 'Id'

  has_one :mapping, as: :rock_record
  has_one :arena_record, through: :mapping

  attr_accessor :Latitude, :Longitude

  after_save do |instance|
    if instance.Latitude && instance.Longitude 
      RockLocation.where(Id: instance.Id).update_all("GeoPoint = geography::Point(#{instance.Latitude},#{instance.Longitude},4326)")
    end
  end

  def copy_arena_address(arena)

    self.Guid ||= SecureRandom.uuid

    self.LocationTypeValueId = RockGroupLocation::FAMILY_HOME_TYPE
    self.IsActive ||= true
    self.Street1 = arena.street_address_1
    self.Street2 = arena.street_address_2
    self.City = arena.city
    self.State = arena.state
    self.PostalCode = arena.postal_code
    self.Country = arena.country
    self.CreatedDateTime = arena.date_created
    self.ModifiedDateTime = arena.date_modified

    if (arena.Latitude && arena.Longitude) && (arena.Latitude > 0 || arena.Longitude > 0)
      self.Latitude = arena.Latitude
      self.Longitude = arena.Longitude
      self.GeocodedDateTime = arena.date_geocoded
      self.StandardizedDateTime = arena.date_standardized
    end
    
  end
end
