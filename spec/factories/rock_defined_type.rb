
FactoryGirl.define do
  factory :RockDefinedType do
    IsSystem false
    Order 1
    Name 'Location'
    Guid SecureRandom.uuid
  end
end