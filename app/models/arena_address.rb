# == Schema Information
#
# Table name: arena_addresses
#
#  address_id        :integer          not null, primary key
#  date_created      :datetime
#  date_modified     :datetime
#  created_by        :string
#  modified_by       :string
#  street_address_1  :string
#  street_address_2  :string
#  city              :string
#  state             :string
#  postal_code       :string
#  Latitude          :float
#  Longitude         :float
#  standardize_code  :integer
#  standardize_msg   :string
#  foreign_key       :integer
#  XAxis             :float
#  YAxis             :float
#  ZAxis             :float
#  date_geocoded     :datetime
#  date_standardized :datetime
#  area_id           :integer
#  geocode_service   :string
#  geocode_status    :integer
#  route             :string
#  dpbc              :string
#  lot               :string
#  endorsement_line  :string
#  container_label   :string
#  country           :string
#

class ArenaAddress < ActiveRecord::Base
  self.primary_key = :address_id
end
