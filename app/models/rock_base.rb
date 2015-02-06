class RockBase < ActiveRecord::Base
  self.abstract_class = true
  self.primary_key = 'Id'

  def Guid=g
    write_attribute :Guid, g.to_s.downcase 
  end

  def Guid
    read_attribute(:Guid).to_s.downcase
  end

end
