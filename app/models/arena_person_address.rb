# == Schema Information
#
# Table name: arena_person_addresses
#
#  person_id         :integer          not null, primary key
#  address_id        :integer          not null, primary key
#  address_type_luid :integer          not null, primary key
#  primary_address   :boolean
#  active_date       :datetime
#  inactive_date     :datetime
#  from_month_day    :string
#  to_month_day      :string
#  notes             :string
#

class ArenaPersonAddress < ArenaBase
  self.primary_key = :person_id,:address_id,:address_type_luid

  belongs_to :person, class: ArenaPerson
  belongs_to :address, class: ArenaAddress
  belongs_to :address_type, class: ArenaLookup, foreign_key: :address_type_luid
end
