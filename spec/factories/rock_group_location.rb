
FactoryGirl.define do
  factory :RockGroupLocation do
    Id RockGroupLocation::FAMILY_HOME_TYPE
    GroupId 1
    LocationId 1
    IsMailingLocation true
    IsMappedLocation false
    Guid SecureRandom.uuid
  end
end