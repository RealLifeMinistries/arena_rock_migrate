
FactoryGirl.define do
  factory :RockDefinedType do
    Id 1
    IsSystem false
    Order 1
    Name 'Location'
    Guid SecureRandom.uuid
  end
end