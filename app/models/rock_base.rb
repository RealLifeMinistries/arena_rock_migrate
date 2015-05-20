class RockBase < ActiveRecord::Base
  self.abstract_class = true
  self.primary_key = 'Id'
  establish_connection "#{Rails.env}_rock".to_sym

  def Guid=g
    write_attribute :Guid, g.to_s.downcase 
  end

  def Guid
    if read_attribute(:Guid)
      read_attribute(:Guid).to_s.downcase
    else
      nil
    end
  end

end
