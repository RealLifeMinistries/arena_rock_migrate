
FactoryGirl.define do
  factory :RockDefinedValue do
    IsSystem false
    association :defined_type, factory: :RockDefinedType
    Order 1
    Value 'Post Falls'
    Guid SecureRandom.uuid
  end
end