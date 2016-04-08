
FactoryGirl.define do
  factory :ParticipantProfileType, class:ArenaProfileType  do
    id ArenaProfileType::PARTICIPANT
    name 'Participant profile type'
  end
  factory :ServingProfileType, class:ArenaProfileType do
    id ArenaProfileType::SERVING
    name 'Serving profile type'
  end
  factory :ClassesEventsType, class:ArenaProfileType do
    id ArenaProfileType::CLASSES_EVENTS
    name 'Classes Events profile types'
  end
end