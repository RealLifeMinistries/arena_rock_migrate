# == Schema Information
#
# Table name: smgp_member
#
#  group_id       :integer          not null, primary key
#  person_id      :integer          not null, primary key
#  date_created   :datetime         not null
#  date_modified  :datetime         not null
#  created_by     :varchar(50)      not null
#  modified_by    :varchar(50)      not null
#  role_luid      :integer
#  date_joined    :datetime         not null
#  notes          :varchar(255)     not null
#  uniform_number :integer          default(-1), not null
#  active         :boolean          default(TRUE), not null
#

class Arena::SmallGroupMember < Arena::Base
  self.table_name = 'smgp_member'
  self.primary_key = :group_id, :person_id
end
