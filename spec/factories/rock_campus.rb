
FactoryGirl.define do
  factory :PFCampus, class: :RockCampus do
    Id 1
    IsSystem false
    Name 'Post Falls'
    Guid SecureRandom.uuid
  end
  factory :CDACampus, class: :RockCampus do
    Id 2
    IsSystem false
    Name 'CDA'
    Guid SecureRandom.uuid
  end
end