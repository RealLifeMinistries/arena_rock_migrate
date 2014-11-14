# == Schema Information
#
# Table name: smgp_member
#
#  group_id       :integer          not null, primary key
#  person_id      :integer          not null, primary key
#  date_created   :datetime         not null
#  date_modified  :datetime         not null
#  created_by     :string(50)       not null
#  modified_by    :string(50)       not null
#  role_luid      :integer
#  date_joined    :datetime         not null
#  notes          :string(255)      not null
#  uniform_number :integer          not null
#  active         :boolean          not null
#

class Arena::SmallGroupMember < Arena::Base
  self.table_name = 'smgp_member'
  self.primary_key = :group_id, :person_id
end
