# == Schema Information
#
# Table name: core_address
#
#  address_id        :integer          not null, primary key
#  date_created      :datetime         not null
#  date_modified     :datetime         not null
#  created_by        :varchar(50)      default(""), not null
#  modified_by       :varchar(50)      default(""), not null
#  street_address_1  :varchar(100)     default(""), not null
#  street_address_2  :varchar(100)     default(""), not null
#  city              :varchar(64)      default(""), not null
#  state             :varchar(12)      default(""), not null
#  postal_code       :varchar(24)      default(""), not null
#  Latitude          :float            default(0.0), not null
#  Longitude         :float            default(0.0), not null
#  standardize_code  :integer          default(0), not null
#  standardize_msg   :varchar(255)     default(""), not null
#  foreign_key       :integer
#  XAxis             :float            default(0.0), not null
#  YAxis             :float            default(0.0), not null
#  ZAxis             :float            default(0.0), not null
#  date_geocoded     :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  date_standardized :datetime         default(Mon, 01 Jan 1900 00:00:00 UTC +00:00), not null
#  area_id           :integer
#  geocode_service   :varchar(50)      default(""), not null
#  geocode_status    :integer          default(0), not null
#  route             :varchar(50)      default(""), not null
#  dpbc              :varchar(50)      default(""), not null
#  lot               :varchar(50)      default(""), not null
#  endorsement_line  :varchar(50)      default(""), not null
#  container_label   :varchar(50)      default(""), not null
#  country           :varchar(2)       default(""), not null
#

class Arena::Address < Arena::Base
  self.primary_key = :address_id
  self.table_name = :core_address
end
