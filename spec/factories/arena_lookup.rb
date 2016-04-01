
FactoryGirl.define do
  factory :SmallGroupMemberLookup, class: :ArenaLookup do
    guid SecureRandom.uuid
    lookup_type
    lookup_value 'Member'

    factory :SmallGroupLeaderLookup do
      lookup_value 'Group Leader'
    end

    factory :SmallGroupAdminLookup do
      lookup_value 'Group Admin'
    end
  end
end