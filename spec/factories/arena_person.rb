
FactoryGirl.define do
  factory :ArenaPerson do
    guid SecureRandom.uuid
    first_name 'Bob'
    last_name 'Fake'
    association :gender_record, factory: :female
    Notes 'test note'
  end
end