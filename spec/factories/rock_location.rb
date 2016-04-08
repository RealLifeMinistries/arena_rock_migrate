
FactoryGirl.define do
  factory :RockLocation do
    Id 1
    LocationTypeValueId 1
    IsActive true
    Name 'RockLocation'
    Guid SecureRandom.uuid
    Street1 '1234 main st'
    City 'Candy Cane'
    State 'ID'
    Country 'USA'
  end
end