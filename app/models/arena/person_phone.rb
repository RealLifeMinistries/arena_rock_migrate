# == Schema Information
#
# Table name: core_person_phone
#
#  person_id             :integer          not null, primary key
#  phone_luid            :integer          not null, primary key
#  phone_number          :varchar(50)      not null
#  phone_ext             :varchar(50)      default(""), not null
#  unlisted              :boolean          default(FALSE), not null
#  phone_number_stripped :varchar(50)      default(""), not null
#  sms_enabled           :boolean          default(FALSE), not null
#

class Arena::PersonPhone < Arena::Base
  self.table_name = 'core_person_phone'
  self.primary_key = :person_id,:phone_luid

end
