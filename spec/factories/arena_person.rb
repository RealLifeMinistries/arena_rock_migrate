
FactoryGirl.define do
  factory :ArenaPerson do |u|
    u.sequence(:guid) { SecureRandom.uuid }
    first_name 'Bob'
    last_name 'Fake'
    #association :gender_record, factory: :ArenaGender
    gender 1
    Notes 'test note'
  end
end