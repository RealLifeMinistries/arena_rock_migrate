# == Schema Information
#
# Table name: core_family_member
#
#  family_id     :integer          not null, primary key
#  person_id     :integer          not null, primary key
#  date_created  :datetime         not null
#  date_modified :datetime         not null
#  created_by    :string(50)       not null
#  modified_by   :string(50)       not null
#  role_luid     :integer          not null
#

class Arena::FamilyMember < Arena::Base
  self.table_name = :core_family_member
  self.primary_keys = :family_id, :person_id
end
