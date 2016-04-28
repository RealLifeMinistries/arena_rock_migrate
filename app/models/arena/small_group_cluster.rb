# == Schema Information
#
# Table name: smgp_group_cluster
#
#  group_cluster_id      :integer          not null, primary key
#  date_created          :datetime         not null
#  date_modified         :datetime         not null
#  created_by            :varchar(50)      default(""), not null
#  modified_by           :varchar(50)      default(""), not null
#  organization_id       :integer          not null
#  parent_cluster_id     :integer
#  leader_person_id      :integer
#  admin_person_id       :integer
#  cluster_name          :varchar(100)     default(""), not null
#  cluster_url           :varchar(100)     default(""), not null
#  cluster_desc          :varchar(1000)    default(""), not null
#  cluster_notes         :varchar(2000)    default(""), not null
#  foreign_region_key    :integer          default(-1), not null
#  foreign_subregion_key :integer          default(-1), not null
#  cluster_type_id       :integer          not null
#  cluster_level         :integer          default(-1), not null
#  image_blob_id         :integer
#  area_id               :integer
#  active                :boolean          default(TRUE), not null
#  guid                  :uuid             not null
#

class Arena::SmallGroupCluster < Arena::Base
  self.primary_key = :group_cluster_id
  self.table_name = 'smgp_group_cluster'
end
