# == Schema Information
#
# Table name: core_profile
#
#  profile_id                  :integer          not null, primary key
#  date_created                :datetime         not null
#  date_modified               :datetime         not null
#  created_by                  :varchar(50)      default(""), not null
#  modified_by                 :varchar(50)      default(""), not null
#  profile_type                :integer          default(-1), not null
#  organization_id             :integer          default(-1), not null
#  department_id               :integer
#  parent_profile_id           :integer
#  owner_id                    :integer
#  profile_name                :varchar(100)     default(""), not null
#  profile_desc                :varchar(5000)    default(""), not null
#  notes                       :varchar(2000)    default(""), not null
#  active                      :boolean          default(TRUE), not null
#  display_order               :integer          default(0), not null
#  foreign_key                 :varchar(50)
#  category_level              :boolean          default(FALSE), not null
#  blob_id                     :integer
#  qualifier                   :integer
#  owner_relationship_strength :integer          default(0), not null
#  peer_relationship_strength  :integer          default(0), not null
#  guid                        :uuid             not null
#  campus_id                   :integer
#

class Arena::Profile < Arena::Base
  self.primary_key = 'profile_id'
  self.table_name = 'core_profile'
end
