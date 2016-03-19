
FactoryGirl.define do
  factory :PFWOnlineOccurrence, class:ArenaOccurrence do
    occurrence_id 821
    occurrence_name 'Sunday'
    association :occurrence_type, factory: :PFWeekendOnline

    factory :PFWOccurrence do
      occurrence_id 1
      association :occurrence_type, factory: :PFWeekendWorship
    end
    factory :CDAWOccurrence do
      occurrence_id 524
      association :occurrence_type, factory: :CDAWeekendWorship
    end
  end
end