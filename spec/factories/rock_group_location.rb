
FactoryGirl.define do
  factory :RockGroupLocation do
    Id RockGroupLocation::FAMILY_HOME_TYPE
    association :RockGroup
    association :RockLocation
    IsMailingLocation true
    IsMappedLocation false
    Guid SecureRandom.uuid
  end
end