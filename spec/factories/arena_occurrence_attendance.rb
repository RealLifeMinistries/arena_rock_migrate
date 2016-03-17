FactoryGirl.define do
  factory :ArenaOccurrenceAttendance do
    association :occurrence_type, factory: :ArenaOccurrence
    association :person_id, factory: :ArenaPerson
    attended true
    type '1'
  end
end