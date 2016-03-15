
FactoryGirl.define do
  factory :ArenaOccurrence do
    date_created {Time.now}
    occurence_name 'Monday'
    occurence_type 4
  end
end