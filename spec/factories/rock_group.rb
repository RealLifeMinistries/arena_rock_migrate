
FactoryGirl.define do
  factory :RockGroup do
    IsSystem false
    association :group_type, factory: :RockGroupType
    Name 'RockGroup'
    IsSecurityRole false
    IsActive false
    Order 0
    Guid SecureRandom.uuid
  end
end