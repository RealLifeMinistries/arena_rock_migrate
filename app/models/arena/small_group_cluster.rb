# == Schema Information
#
# Table name: smgp_group_cluster
#
#  group_cluster_id      :integer          not null, primary key
#  date_created          :datetime         not null
#  date_modified         :datetime         not null
#  created_by            :string(50)       not null
#  modified_by           :string(50)       not null
#  organization_id       :integer          not null
#  parent_cluster_id     :integer
#  leader_person_id      :integer
#  admin_person_id       :integer
#  cluster_name          :string(100)      not null
#  cluster_url           :string(100)      not null
#  cluster_desc          :string(1000)     not null
#  cluster_notes         :string(2000)     not null
#  foreign_region_key    :integer          not null
#  foreign_subregion_key :integer          not null
#  cluster_type_id       :integer          not null
#  cluster_level         :integer          not null
#  image_blob_id         :integer
#  area_id               :integer
#  active                :boolean          not null
#  guid                  :uuid             not null
#

class Arena::SmallGroupCluster < Arena::Base
  self.primary_key = :group_cluster_id
  self.table_name = 'smgp_group_cluster'
end
