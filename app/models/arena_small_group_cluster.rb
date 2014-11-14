# == Schema Information
#
# Table name: arena_small_group_clusters
#
#  group_cluster_id      :integer          not null, primary key
#  date_created          :datetime
#  date_modified         :datetime
#  created_by            :string
#  modified_by           :string
#  organization_id       :integer
#  parent_cluster_id     :integer
#  leader_person_id      :integer
#  admin_person_id       :integer
#  cluster_name          :string
#  cluster_url           :string
#  cluster_desc          :string
#  cluster_notes         :string
#  foreign_region_key    :integer
#  foreign_subregion_key :integer
#  cluster_type_id       :integer
#  cluster_level         :integer
#  image_blob_id         :integer
#  area_id               :integer
#  active                :boolean
#  guid                  :uuid
#

class ArenaSmallGroupCluster < ActiveRecord::Base
  self.primary_key = :group_cluster_id
  belongs_to :parent, class: ArenaSmallGroupCluster, foreign_key: 'parent_cluster_id'
  belongs_to :leader, class: ArenaPerson, foreign_key: 'leader_person_id'
  belongs_to :admin, class: ArenaPerson, foreign_key: 'admin_person_id'
  belongs_to :area, class: ArenaArea

  has_many :groups, class: ArenaSmallGroup, foreign_key: 'group_cluster_id'
end
