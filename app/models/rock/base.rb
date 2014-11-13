class Rock::Base < ActiveRecord::Base
  self.abstract_class = true
  self.primary_key = 'Id'
  establish_connection :development_rock 

  # Geography data type not compatible yet with rails, postgresql
  def GeoPoint=d
    d
  end

  def GeoFence=d
    d
  end

end
