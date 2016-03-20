
FactoryGirl.define do
  factory :PFWOnlineOccurrence, class:ArenaOccurrence do
    occurrence_id ArenaOccurrence::POST_FALLS_WEEKEND_WS_LIVE_ONLINE
    occurrence_name 'Sunday'
    association :type_record, factory: :PFWeekendOnline

    factory :PFWOccurrence do
      occurrence_id ArenaOccurrence::ALL_POST_FALLS_WEEKEND_WORSHIP_SERVICES
      association :type_record, factory: :PFWeekendWorship
    end
    factory :CDAWOccurrence do
      occurrence_id ArenaOccurrence::RLM_CDA_WEEKEND_WORSHIP
      association :type_record, factory: :CDAWeekendWorship
    end
  end
end