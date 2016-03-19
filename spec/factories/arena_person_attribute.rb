
FactoryGirl.define do
  factory :ArenaPersonAttribute do
    association :person, factory: :ArenaPerson
    association :attribute_group, factory: :ArenaAttributeGroup
    varchar_value 'Arena Attribute'
  end
end