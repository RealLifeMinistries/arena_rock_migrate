FactoryGirl.define do
  factory :PFArenaSmallGroupMember, aliases:[:member], class:ArenaSmallGroupMember do
    association :group, factory: :PFArenaSmallGroup
    association :person, factory: :ArenaPerson
    association :role, factory: :SmallGroupMemberLookup
    active true

    trait :group_leader do
      association :role, factory: :SmallGroupLeaderLookup
    end
    trait :group_admin do
      association :role, factory: :SmallGroupAdminLookup
    end

    factory :CDAArenaSmallGroupMember do
      association :group, factory: :CDAArenaSmallGroup
    end

    factory :OtherSmallGroupMember do
      association :group, factory: :OtherArenaSmallGroup
    end
  end
end