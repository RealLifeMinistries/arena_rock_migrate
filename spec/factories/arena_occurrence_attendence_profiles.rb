
FactoryGirl.define do
  factory :ArenaOccurrenceAttendanceProfile do
    association :occurrence_type, factory: :ArenaOccurrence
    association :profile_id, factory: :ArenaProfile
  end
end