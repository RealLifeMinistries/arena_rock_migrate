class Rock::AttributeCategory < Rock::Base
  self.table_name = 'AttributeCategory'
  self.primary_key = :AttributeId, :CategoryId
end
