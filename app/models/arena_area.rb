# == Schema Information
#
# Table name: arena_areas
#
#  area_id          :integer          not null, primary key
#  date_created     :datetime
#  date_modified    :datetime
#  created_by       :string
#  modified_by      :string
#  organization_id  :integer
#  area_name        :string
#  area_description :string
#  map_width        :integer
#  map_height       :integer
#  thumb_blob_id    :integer
#  image_blob_id    :integer
#  large_blob_id    :integer
#  min_latitude     :float
#  max_latitude     :float
#  min_longitude    :float
#  max_longitude    :float
#  refresh_required :boolean
#  foreign_key      :integer
#  date_refreshed   :datetime
#  guid             :uuid
#

class ArenaArea < ActiveRecord::Base
  self.primary_key = :area_id
end
