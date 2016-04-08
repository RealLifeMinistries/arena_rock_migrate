require 'rspec'

describe 'Arena Profile should sync to Rock' do

  it 'should create a RockGroup::PARTICIPANT_MINISTRY' do
    p = build(:ParticipantProfileType)
    p.mapping = Mapping.new(arena_record: p)
    profile = create(:MinistryProfile, :ParticipantProfile, profile_type_record:p)
    profile.sync_to_rock!
    expect(profile.instance_variable_get(:@rock).GroupTypeId).to be(RockGroupType::PARTICIPANT_MINISTRY)
  end
  it 'should create a RockGroup with type SERVANT' do
    s = build(:ServingProfileType)
    s.mapping = Mapping.new(arena_record: s)
    profile = create(:MinistryProfile, :ServingProfile, profile_type_record:s)
    profile.sync_to_rock!
    expect(profile.instance_variable_get(:@rock).GroupTypeId).to be(RockGroupType::SERVING)
  end
  #it 'should create a RockGroup with type CLASS' do
  #  s = build(:ClassesEventsType)
  #  s.mapping = Mapping.new(arena_record: s)
  #  profile = create(:MinistryProfile, :ClassesProfile, profile_type_record:s)
  #  profile.sync_to_rock!
  #  expect(profile.instance_variable_get(:@rock).GroupTypeId).to be(RockGroupType::CLASS)
  #end
  #it 'should create a RockGroup with type EVENTS' do
  #  s = build(:ClassesEventsType)
  #  s.mapping = Mapping.new(arena_record: s)
  #  profile = create(:MinistryProfile, :EventsProfile, profile_type_record:s)
  #  profile.sync_to_rock!
  #  expect(profile.instance_variable_get(:@rock).GroupTypeId).to be(RockGroupType::EVENTS)
  #end
end