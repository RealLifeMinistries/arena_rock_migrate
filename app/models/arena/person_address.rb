# == Schema Information
#
# Table name: core_person_address
#
#  person_id         :integer          not null, primary key
#  address_id        :integer          not null, primary key
#  address_type_luid :integer          not null, primary key
#  primary_address   :boolean          not null
#  active_date       :datetime
#  inactive_date     :datetime
#  from_month_day    :varchar(4)
#  to_month_day      :varchar(4)
#  notes             :varchar(255)     not null
#

class Arena::PersonAddress < Arena::Base
  self.table_name = "core_person_address"
  self.primary_key = :person_id,:address_id,:address_type_luid
end
