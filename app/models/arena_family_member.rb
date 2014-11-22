# == Schema Information
#
# Table name: arena_family_members
#
#  family_id     :integer          not null, primary key
#  person_id     :integer          not null, primary key
#  date_created  :datetime
#  date_modified :datetime
#  created_by    :string
#  modified_by   :string
#  role_luid     :integer
#

class ArenaFamilyMember < ActiveRecord::Base
  self.primary_keys = :family_id, :person_id

  belongs_to :person, class: ArenaPerson
  belongs_to :family, class: ArenaFamily
  belongs_to :role, class: ArenaLookup, foreign_key: :role_luid

end
