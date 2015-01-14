class ArenaCampus < ActiveRecord::Base
  self.primary_key = 'campus_id'

  has_rock_mapping
end
