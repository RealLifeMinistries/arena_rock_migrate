# == Schema Information
#
# Table name: core_area
#
#  area_id          :integer          not null, primary key
#  date_created     :datetime         not null
#  date_modified    :datetime         not null
#  created_by       :varchar(50)      not null
#  modified_by      :varchar(50)      not null
#  organization_id  :integer          default(-1), not null
#  area_name        :varchar(100)     default(""), not null
#  area_description :varchar(1000)    default(""), not null
#  map_width        :integer          default(400), not null
#  map_height       :integer          default(400), not null
#  thumb_blob_id    :integer
#  image_blob_id    :integer
#  large_blob_id    :integer
#  min_latitude     :float            default(0.0), not null
#  max_latitude     :float            default(0.0), not null
#  min_longitude    :float            default(0.0), not null
#  max_longitude    :float            default(0.0), not null
#  refresh_required :boolean          default(TRUE), not null
#  foreign_key      :integer
#  date_refreshed   :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  guid             :uuid             not null
#

class Arena::Area < Arena::Base
  self.primary_key = :area_id
  self.table_name = 'core_area'
end
