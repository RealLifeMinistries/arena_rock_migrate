FactoryGirl.define do
  factory :PFWorshipOnlineAttendee, class:ArenaOccurrenceAttendance do
    association :occurrence, factory: :PFWOnlineOccurrence
    association :person, factory: :ArenaPerson
    attended true
    type '1'
    check_in_time Time.new

    factory :PFWorshipWeekendAttendee do
      association :occurrence, factory: :PFWOccurrence
    end
    factory :CDAWorshipWeekendAttendee do
      association :occurrence, factory: :CDAWOccurrence
    end
  end
end