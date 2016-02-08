# == Schema Information
#
# Table name: core_address
#
#  address_id        :integer          not null, primary key
#  date_created      :datetime         not null
#  date_modified     :datetime         not null
#  created_by        :varchar(50)      not null
#  modified_by       :varchar(50)      not null
#  street_address_1  :varchar(100)     not null
#  street_address_2  :varchar(100)     not null
#  city              :varchar(64)      not null
#  state             :varchar(12)      not null
#  postal_code       :varchar(24)      not null
#  Latitude          :float            not null
#  Longitude         :float            not null
#  standardize_code  :integer          not null
#  standardize_msg   :varchar(255)     not null
#  foreign_key       :integer
#  XAxis             :float            not null
#  YAxis             :float            not null
#  ZAxis             :float            not null
#  date_geocoded     :datetime         not null
#  date_standardized :datetime         not null
#  area_id           :integer
#  geocode_service   :varchar(50)      not null
#  geocode_status    :integer          not null
#  route             :varchar(50)      not null
#  dpbc              :varchar(50)      not null
#  lot               :varchar(50)      not null
#  endorsement_line  :varchar(50)      not null
#  container_label   :varchar(50)      not null
#  country           :varchar(2)       not null
#

class Arena::Address < Arena::Base
  self.primary_key = :address_id
  self.table_name = :core_address
end
