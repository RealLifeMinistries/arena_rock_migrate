# == Schema Information
#
# Table name: arena_families
#
#  family_id       :integer          not null, primary key
#  date_created    :datetime
#  date_modified   :datetime
#  created_by      :string
#  modified_by     :string
#  family_name     :string
#  foreign_key     :integer
#  organization_id :integer
#

class ArenaFamily < ActiveRecord::Base
  self.primary_key = :family_id

  has_many :family_memberships, foreign_key: :family_id, class: ArenaFamilyMember
  has_many :members, through: :family_memberships, class: ArenaPerson, foreign_key: :person_id
end
