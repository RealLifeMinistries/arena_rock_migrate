
FactoryGirl.define do
  factory :PFWeekendOnline, class:ArenaOccurrenceType do
    occurrence_type_id ArenaOccurrence::POST_FALLS_WEEKEND_WS_LIVE_ONLINE
    type_name 'Post Falls Weekend WS Live Online'

    factory :PFWeekendWorship, class:ArenaOccurrenceType do
      occurrence_type_id ArenaOccurrence::ALL_POST_FALLS_WEEKEND_WORSHIP_SERVICES
      type_name 'All Post Falls Weekend Worship Services'
    end
    factory :CDAWeekendWorship, class:ArenaOccurrenceType do
      occurrence_type_id ArenaOccurrence::RLM_CDA_WEEKEND_WORSHIP
      type_name 'RLM CDA Weekend Worship'
    end
  end
end