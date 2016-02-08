# == Schema Information
#
# Table name: core_area
#
#  area_id          :integer          not null, primary key
#  date_created     :datetime         not null
#  date_modified    :datetime         not null
#  created_by       :varchar(50)      not null
#  modified_by      :varchar(50)      not null
#  organization_id  :integer          not null
#  area_name        :varchar(100)     not null
#  area_description :varchar(1000)    not null
#  map_width        :integer          not null
#  map_height       :integer          not null
#  thumb_blob_id    :integer
#  image_blob_id    :integer
#  large_blob_id    :integer
#  min_latitude     :float            not null
#  max_latitude     :float            not null
#  min_longitude    :float            not null
#  max_longitude    :float            not null
#  refresh_required :boolean          not null
#  foreign_key      :integer
#  date_refreshed   :datetime         not null
#  guid             :uuid             not null
#

class Arena::Area < Arena::Base
  self.primary_key = :area_id
  self.table_name = 'core_area'
end
