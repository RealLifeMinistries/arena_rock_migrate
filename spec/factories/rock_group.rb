
FactoryGirl.define do
  factory :RockGroup do
    Id 1
    IsSystem false
    GroupTypeId 1
    Name 'RockGroup'
    IsSecurityRole false
    IsActive false
    Order 0
    Guid SecureRandom.uuid
  end
end