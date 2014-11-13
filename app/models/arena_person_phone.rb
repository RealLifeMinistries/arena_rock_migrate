# == Schema Information
#
# Table name: arena_person_phones
#
#  person_id             :integer          not null, primary key
#  phone_luid            :integer          not null, primary key
#  phone_number          :string
#  phone_ext             :string
#  unlisted              :boolean
#  phone_number_stripped :string
#  sms_enabled           :boolean
#

class ArenaPersonPhone < ActiveRecord::Base
  self.primary_key = :person_id,:phone_luid

  belongs_to :person, class: ArenaPerson
  belongs_to :phone_type, class: ArenaLookup, foreign_key: :phone_luid
end
