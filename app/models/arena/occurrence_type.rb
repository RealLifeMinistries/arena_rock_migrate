# == Schema Information
#
# Table name: core_occurrence_type
#
#  occurrence_type_id            :integer          not null, primary key
#  date_created                  :datetime         not null
#  date_modified                 :datetime         not null
#  created_by                    :varchar(50)      not null
#  modified_by                   :varchar(50)      not null
#  type_order                    :integer          not null
#  type_name                     :varchar(50)      not null
#  min_age                       :decimal(9, 2)    not null
#  max_age                       :decimal(9, 2)    not null
#  age_range_text                :varchar(50)      not null
#  schema_file_path              :varchar(1000)    not null
#  photo_confirmation            :boolean          not null
#  location_specific_occurrences :boolean          not null
#  sync_with_profile             :integer
#  sync_with_cluster             :integer
#  membership_required           :boolean          not null
#  use_altid_for_family          :boolean          not null
#  is_service                    :boolean          not null
#  group_id                      :integer          not null
#  merge_days                    :integer          not null
#  gender_preference             :integer          not null
#  sync_with_group               :integer
#  checkout_required             :boolean          not null
#  secured                       :boolean          not null
#  theme_id                      :integer
#  allow_unknown_age             :boolean          not null
#  min_grade                     :integer          not null
#  max_grade                     :integer          not null
#  pager_required                :boolean          not null
#  profile_source_luid           :integer
#  profile_status_luid           :integer
#  min_birth_date                :datetime         not null
#  max_birth_date                :datetime         not null
#  use_room_ratios               :boolean          not null
#  leader_profile_id             :integer
#  people_per_leader             :integer          not null
#  min_leaders                   :integer          not null
#

class Arena::OccurrenceType < Arena::Base
  self.table_name = 'core_occurrence_type'
  self.primary_key = :occurrence_type_id
end
