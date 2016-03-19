FactoryGirl.define do
  factory :PFWorshipOnlineAttendee, class:ArenaOccurrenceAttendance do
    association :occurrence, factory: :PFWOnlineOccurrence
    association :person, factory: :ArenaPerson
    attended true
    type '1'

    factory :PFWorshipWeekendAttendee do
      association :occurrence_type, factory: :PFWOccurrence
    end
    factory :CDAWorshipWeekendAttendee do
      association :occurrence_type, factory: :CDAWOccurrence
    end
  end
end