class ArenaProfileMember < ActiveRecord::Base
  self.primary_key = :profile_id, :person_id
end
