require 'rspec'

describe 'ArenaOccurrenceAttendance can sync to rock' do
  it 'Should create a RockAttendance from ArenaOccurrenceAttendance PFWorshipOnline' do
    #create(:RockCampus)
    attendee = create(:PFWorshipOnlineAttendee)
    attendee.sync_to_rock!
    expect(attendee.instance_variable_get(:@rock)).to be_a(RockAttendance)
    expect(attendee.instance_variable_get(:@rock).GroupId).to be RockAttendance::WEEKEND_WORSHIP_SERVICE_GROUP
  end
end
describe 'PFWorshipWeekendService ArenaOccurrenceAttendance can sync to rock' do
  it 'Should create a RockAttendance from ArenaOccurrenceAttendance PFWorshipWeekendAttendee' do
    #create(:RockCampus)
    attendee = create(:PFWorshipWeekendAttendee)
    attendee.sync_to_rock!
    expect(attendee.instance_variable_get(:@rock)).to be_a(RockAttendance)
    expect(attendee.instance_variable_get(:@rock).GroupId).to be RockAttendance::WEEKEND_WORSHIP_SERVICE_GROUP
  end
end
describe 'CDAWorshipAttendance ArenaOccurrenceAttendance can sync to rock' do
  it 'Should create a RockAttendance from ArenaOccurrenceAttendance CDAWorshipAttendance' do
    #create(:RockCampus)
    attendee = create(:CDAWorshipWeekendAttendee)
    attendee.sync_to_rock!
    expect(attendee.instance_variable_get(:@rock)).to be_a(RockAttendance)
    expect(attendee.instance_variable_get(:@rock).GroupId).to be RockAttendance::CDA_WEEKEND_WORSHIP_SERVICE_GROUP
  end
end