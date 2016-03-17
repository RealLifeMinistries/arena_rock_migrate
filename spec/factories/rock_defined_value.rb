
FactoryGirl.define do
  factory :RockDefinedValue do
    Id RockGroupLocation::FAMILY_HOME_TYPE
    IsSystem false
    DefinedTypeId 1
    Order 1
    Value 'Post Falls'
    Guid SecureRandom.uuid
  end
end