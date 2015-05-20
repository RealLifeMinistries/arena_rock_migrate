class Rock::Base < ActiveRecord::Base
  self.abstract_class = true
  self.primary_key = 'Id'
  establish_connection "#{Rails.env}_rock".to_sym 

  # Geography data type not compatible yet with rails, postgresql
  def GeoPoint=d
    d
  end

  def GeoFence=d
    d
  end

  def Guid=g
    write_attribute :Guid, g.to_s.upcase 
  end

  def Guid
    read_attribute(:Guid).to_s.downcase
  end

end
