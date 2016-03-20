
FactoryGirl.define do
  factory :RockCampus do
    Id 1
    IsSystem false
    Name 'Post Falls'
    Guid SecureRandom.uuid
  end
end