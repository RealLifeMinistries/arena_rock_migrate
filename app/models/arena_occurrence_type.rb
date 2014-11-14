# == Schema Information
#
# Table name: arena_occurrence_types
#
#  occurrence_type_id            :integer          not null, primary key
#  date_created                  :datetime
#  date_modified                 :datetime
#  created_by                    :string
#  modified_by                   :string
#  type_order                    :integer
#  type_name                     :string
#  min_age                       :decimal(9, 2)
#  max_age                       :decimal(9, 2)
#  age_range_text                :string
#  schema_file_path              :string
#  photo_confirmation            :boolean
#  location_specific_occurrences :boolean
#  sync_with_profile             :integer
#  sync_with_cluster             :integer
#  membership_required           :boolean
#  use_altid_for_family          :boolean
#  is_service                    :boolean
#  group_id                      :integer
#  merge_days                    :integer
#  gender_preference             :integer
#  sync_with_group               :integer
#  checkout_required             :boolean
#  secured                       :boolean
#  theme_id                      :integer
#  allow_unknown_age             :boolean
#  min_grade                     :boolean
#  max_grade                     :integer
#  pager_required                :boolean
#  profile_source_luid           :integer
#  profile_status_luid           :integer
#  min_birth_date                :datetime
#  max_birth_date                :datetime
#  use_room_ratios               :boolean
#  leader_profile_id             :integer
#  people_per_leader             :integer
#  min_leaders                   :integer
#

class ArenaOccurrenceType < ActiveRecord::Base
  self.primary_key = 'occurrence_type_id'
  belongs_to :profile_source, class: ArenaLookup, foreign_key: :profile_source_luid
  belongs_to :profile_status, class: ArenaLookup, foreign_key: :profile_status_luid
  belongs_to :leader_profile, class: ArenaProfile
end
