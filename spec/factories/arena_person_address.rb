
FactoryGirl.define do
  factory :ArenaPersonAddress do
    association :person, factory: :ArenaPerson
    association :address, factory: :ArenaAddress
    association :address_type, factory: :AddressLookup
    primary_address true
  end
end