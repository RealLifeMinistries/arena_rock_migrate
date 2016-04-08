
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
    factory :AddressLookup do
      lookup_value 'Main/Home Address'
      association :lookup_type, factory: :AddressLookupType
    end
  end
end