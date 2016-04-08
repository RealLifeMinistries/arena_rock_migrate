
FactoryGirl.define do
  factory :MinistryProfile, class:ArenaProfile do |u|
    u.sequence(:guid) { SecureRandom.uuid }
    association :owner, factory: :ArenaPerson
    date_created Time.new()
    created_by 'test'
    organization_id 1
    active 1
    profile_name 'Ministry Profile'
    #trait :members do
    #  after :create do |g|
    #    create_list :ProfileMembers, 5, group: g
    #  end
    #end
    trait :ClassesParentProfile do
      profile_id = 3075
    end
    trait :EventsParentProfile do
      profile_id = 2554
    end
    trait :ParticipantProfile do
      association :profile_type_record, factory: :ParticipantProfileType
    end
    trait :ServingProfile do
      association :profile_type_record, factory: :ServingProfileType
      profile_name 'Serving Profile'
    end
    trait :ClassesProfile do
      association :profile_type_record, factory: :ClassesEventsType
      profile_name 'Classes Profile'
      association :parent, :ClassesParentProfile, factory: :MinistryProfile
    end
    trait :EventsProfile do
      association :profile_type_record, factory: :ClassesEventsType
      profile_name 'Events Profile'
      association :parent, :EventsParentProfile, factory: :MinistryProfile
    end
  end
end