# == Schema Information
#
# Table name: core_occurrence_type
#
#  occurrence_type_id            :integer          not null, primary key
#  date_created                  :datetime         not null
#  date_modified                 :datetime         not null
#  created_by                    :varchar(50)      default(""), not null
#  modified_by                   :varchar(50)      default(""), not null
#  type_order                    :integer          default(999), not null
#  type_name                     :varchar(50)      default(""), not null
#  min_age                       :decimal(9, 2)    default(0.0), not null
#  max_age                       :decimal(9, 2)    default(0.0), not null
#  age_range_text                :varchar(50)      default(""), not null
#  schema_file_path              :varchar(1000)    default(""), not null
#  photo_confirmation            :boolean          default(FALSE), not null
#  location_specific_occurrences :boolean          default(FALSE), not null
#  sync_with_profile             :integer
#  sync_with_cluster             :integer
#  membership_required           :boolean          default(FALSE), not null
#  use_altid_for_family          :boolean          default(TRUE), not null
#  is_service                    :boolean          default(FALSE), not null
#  group_id                      :integer          default(-1), not null
#  merge_days                    :integer          default(-1), not null
#  gender_preference             :integer          default(-1), not null
#  sync_with_group               :integer
#  checkout_required             :boolean          default(FALSE), not null
#  secured                       :boolean          default(FALSE), not null
#  theme_id                      :integer
#  allow_unknown_age             :boolean          default(FALSE), not null
#  min_grade                     :integer          default(-1), not null
#  max_grade                     :integer          default(-1), not null
#  pager_required                :boolean          default(FALSE), not null
#  profile_source_luid           :integer
#  profile_status_luid           :integer
#  min_birth_date                :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  max_birth_date                :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  use_room_ratios               :boolean          default(FALSE), not null
#  leader_profile_id             :integer
#  people_per_leader             :integer          default(0), not null
#  min_leaders                   :integer          default(0), not null
#

class Arena::OccurrenceType < Arena::Base
  self.table_name = 'core_occurrence_type'
  self.primary_key = :occurrence_type_id
end
