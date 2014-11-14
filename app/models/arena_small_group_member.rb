# == Schema Information
#
# Table name: arena_small_group_members
#
#  group_id       :integer          not null, primary key
#  person_id      :integer          not null, primary key
#  date_created   :datetime
#  date_modified  :datetime
#  created_by     :string
#  modified_by    :string
#  role_luid      :integer
#  date_joined    :datetime
#  notes          :string
#  uniform_number :integer
#  active         :boolean
#

class ArenaSmallGroupMember < ActiveRecord::Base
  self.primary_key = :group_id,:person_id
  belongs_to :group, class: ArenaSmallGroup
  belongs_to :person, class: ArenaPerson
  belongs_to :role, class: ArenaLookup, foreign_key: 'role_luid'
end
