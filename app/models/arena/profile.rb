# == Schema Information
#
# Table name: core_profile
#
#  profile_id                  :integer          not null, primary key
#  date_created                :datetime         not null
#  date_modified               :datetime         not null
#  created_by                  :varchar(50)      not null
#  modified_by                 :varchar(50)      not null
#  profile_type                :integer          not null
#  organization_id             :integer          not null
#  department_id               :integer
#  parent_profile_id           :integer
#  owner_id                    :integer
#  profile_name                :varchar(100)     not null
#  profile_desc                :varchar(5000)    not null
#  notes                       :varchar(2000)    not null
#  active                      :boolean          not null
#  display_order               :integer          not null
#  foreign_key                 :varchar(50)
#  category_level              :boolean          not null
#  blob_id                     :integer
#  qualifier                   :integer
#  owner_relationship_strength :integer          not null
#  peer_relationship_strength  :integer          not null
#  guid                        :uuid             not null
#  campus_id                   :integer
#

class Arena::Profile < Arena::Base
  self.primary_key = 'profile_id'
  self.table_name = 'core_profile'
end
