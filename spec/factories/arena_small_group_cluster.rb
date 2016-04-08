FactoryGirl.define do
  factory :PFAllRegionCluster, class:ArenaSmallGroupCluster do |u|
    cluster_name 'PFRLM All Region Home Groups'
    cluster_desc 'Post Falls All Region Home Groups'
    u.sequence(:guid) { SecureRandom.uuid }

    trait :leader do
      association :leader, factory: :ArenaPersonLeader
    end

    trait :admin do
      association :admin, factory: :ArenaPersonAdmin
    end

    trait :small_groups do
      after :create do |c|
        create_list :PFArenaSmallGroup, 5, cluster: c
      end
    end

    trait :small_groups_other do
      after :create do |c|
        create_list :OtherSmallGroup, 5, cluster: c
      end
    end
    factory :CDARegionCluster do
      cluster_name 'CDARLM Campus Home Groups'
      cluster_desc "Coeur D'Alene All Region Home Groups"
    end
    factory :OtherSmallGroupCluster do
      cluster_name 'Other Small group Cluster'
      cluster_desc "Other small group cluster description"
    end
  end
end