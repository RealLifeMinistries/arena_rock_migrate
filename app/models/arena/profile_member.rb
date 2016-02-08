# == Schema Information
#
# Table name: core_profile_member
#
#  profile_id    :integer          not null, primary key
#  person_id     :integer          not null, primary key
#  date_created  :datetime         not null
#  date_modified :datetime         not null
#  created_by    :varchar(50)      not null
#  modified_by   :varchar(50)      not null
#  source_luid   :integer
#  status_luid   :integer
#  notes         :varchar(2000)    not null
#  date_pending  :datetime
#  date_inreview :datetime
#  date_active   :datetime
#  date_dormant  :datetime
#

class Arena::ProfileMember < Arena::Base
  self.primary_key = :profile_id, :person_id
  self.table_name = 'core_profile_member'
end
