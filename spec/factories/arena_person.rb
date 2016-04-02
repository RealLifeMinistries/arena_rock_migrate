
FactoryGirl.define do
  factory :ArenaPerson do |u|
    u.sequence(:guid) { SecureRandom.uuid }
    first_name 'Bob'
    last_name 'Fake'
    gender 1
    Notes 'test note'
    trait :add_locations do
      after :create do |p|
        create_list :ArenaPersonAddress, 1, person: p
      end
      #association :locations, factory: :ArenaPersonAddress
    end
    factory :ArenaPersonLeader do |u|
      last_name 'Leader'
      gender 2
    end
    factory :ArenaPersonAdmin do |u|
      last_name 'Admin'
      gender 1
    end
  end
end