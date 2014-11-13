# == Schema Information
#
# Table name: arena_profiles
#
#  profile_id                  :integer          not null, primary key
#  date_created                :datetime
#  date_modified               :datetime
#  created_by                  :string
#  modified_by                 :string
#  profile_type                :integer
#  organization_id             :integer
#  department_id               :integer
#  parent_profile_id           :integer
#  owner_id                    :integer
#  profile_name                :string
#  profile_desc                :string
#  notes                       :string
#  active                      :boolean
#  display_order               :integer
#  foreign_key                 :string
#  category_level              :boolean
#  blob_id                     :integer
#  qualifier                   :integer
#  owner_relationship_strength :integer
#  peer_relationship_strength  :integer
#  guid                        :uuid
#  campus_id                   :integer
#

class ArenaProfile < ActiveRecord::Base
  self.primary_key = 'profile_id'

  belongs_to :profile_type_record, class: ArenaLookup, foreign_key: :profile_type
  belongs_to :owner, class: ArenaPerson
  belongs_to :parent, class: ArenaProfile, foreign_key: :parent_profile_id

end
