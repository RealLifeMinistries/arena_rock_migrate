
FactoryGirl.define do
  factory :PFWeekendOnline, class:ArenaOccurrenceType do
    type_name 'Post Falls Weekend WS Live Online'
  end
  factory :PFWeekendWorship, class:ArenaOccurrenceType do
    type_name 'All Post Falls Weekend Worship Services'
  end
  factory :CDAWeekendWorship, class:ArenaOccurrenceType do
    type_name 'RLM CDA Weekend Worship'
  end
end