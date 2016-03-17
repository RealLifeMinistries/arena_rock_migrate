
FactoryGirl.define do
  factory :ArenaOccurrence do
    occurrence_name 'Monday'
    association :occurrence_type, factory: :ArenaOccurrenceType
  end
end