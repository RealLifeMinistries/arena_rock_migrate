
FactoryGirl.define do
  factory :PFWOnlineOccurrence, class:ArenaOccurrence do
    occurrence_name 'Sunday'
    association :type_record, factory: :PFWeekendOnline

    factory :PFWOccurrence do
      association :type_record, factory: :PFWeekendWorship
    end
    factory :CDAWOccurrence do
      association :type_record, factory: :CDAWeekendWorship
    end
  end
end