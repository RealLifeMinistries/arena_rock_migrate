# == Schema Information
#
# Table name: core_address
#
#  address_id        :integer          not null, primary key
#  date_created      :datetime         not null
#  date_modified     :datetime         not null
#  created_by        :string(50)       not null
#  modified_by       :string(50)       not null
#  street_address_1  :string(100)      not null
#  street_address_2  :string(100)      not null
#  city              :string(64)       not null
#  state             :string(12)       not null
#  postal_code       :string(24)       not null
#  Latitude          :float(53)        not null
#  Longitude         :float(53)        not null
#  standardize_code  :integer          not null
#  standardize_msg   :string(255)      not null
#  foreign_key       :integer
#  XAxis             :float(53)        not null
#  YAxis             :float(53)        not null
#  ZAxis             :float(53)        not null
#  date_geocoded     :datetime         not null
#  date_standardized :datetime         not null
#  area_id           :integer
#  geocode_service   :string(50)       not null
#  geocode_status    :integer          not null
#  route             :string(50)       not null
#  dpbc              :string(50)       not null
#  lot               :string(50)       not null
#  endorsement_line  :string(50)       not null
#  container_label   :string(50)       not null
#  country           :string(2)        not null
#

class Arena::Address < Arena::Base
  self.primary_key = :address_id
  self.table_name = :core_address
end
