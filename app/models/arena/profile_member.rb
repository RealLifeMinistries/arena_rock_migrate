class Arena::ProfileMember < Arena::Base
  self.primary_key = :profile_id, :person_id
  self.table_name = 'core_profile_member'
end
