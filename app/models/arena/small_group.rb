# == Schema Information
#
# Table name: smgp_group
#
#  group_id                    :integer          not null, primary key
#  date_created                :datetime         not null
#  date_modified               :datetime         not null
#  created_by                  :string(50)       not null
#  modified_by                 :string(50)       not null
#  group_cluster_id            :integer          not null
#  leader_person_id            :integer
#  group_name                  :string(200)      not null
#  group_url                   :string(100)      not null
#  group_desc                  :string(1000)     not null
#  group_notes                 :string(1000)     not null
#  max_members                 :integer          not null
#  topic_luid                  :integer
#  meeting_day_luid            :integer
#  primary_age_luid            :integer
#  primary_marital_status_luid :integer
#  foreign_key                 :integer
#  target_location_person_id   :integer
#  picture_url                 :string(200)
#  schedule                    :string(1000)
#  group_type_luid             :integer
#  image_blob_id               :integer
#  guid                        :uuid             not null
#  is_group_private            :boolean          not null
#  active                      :boolean          not null
#

class Arena::SmallGroup < Arena::Base
  self.table_name = 'smgp_group'
  self.primary_key = :group_id
end
