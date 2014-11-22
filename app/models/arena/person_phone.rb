# == Schema Information
#
# Table name: core_person_phone
#
#  person_id             :integer          not null, primary key
#  phone_luid            :integer          not null, primary key
#  phone_number          :string(50)       not null
#  phone_ext             :string(50)       not null
#  unlisted              :boolean          not null
#  phone_number_stripped :string(50)       not null
#  sms_enabled           :boolean          not null
#

class Arena::PersonPhone < Arena::Base
  self.table_name = 'core_person_phone'
  self.primary_key = :person_id,:phone_luid

end
