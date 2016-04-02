FactoryGirl.define do
  factory :PFArenaSmallGroup, class:ArenaSmallGroup do |sg|
    group_name 'PF sample small group'
    sg.sequence(:guid) { SecureRandom.uuid }
    association :cluster, factory: :PFAllRegionCluster
    trait :memberships do
      after :create do |g|
        create_list :PFArenaSmallGroupMember, 5, group: g
      end
    end
    trait :memberships_other do
      after :create do |g|
        create_list :OtherSmallGroupMember, 5, group: g
      end
    end
    trait :leader_role do
      association :leader, factory: :ArenaPersonLeader
    end
    trait :location_person do
      association :target_location_person, :add_locations, factory: :ArenaPerson
    end
    factory :CDAArenaSmallGroup do
      group_name 'CDA sample small group'
      association :cluster, factory: :CDARegionCluster
    end
    factory :OtherSmallGroup do
      group_name 'Other Small Group'
      association :cluster, factory: :OtherSmallGroupCluster
    end
  end
end