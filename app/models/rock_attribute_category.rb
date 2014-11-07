class RockAttributeCategory < ActiveRecord::Base
  self.primary_key = :AttributeId, :CategoryId
end
