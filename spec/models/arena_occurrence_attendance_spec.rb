require 'rspec'

describe 'ArenaOccurrenceAttendance can sync to rock' do
  it 'should set map to new mapping if mapping is nil' do
    attendee = create(:PFWorshipOnlineAttendee)
    attendee.sync_to_rock!
    expect(attendee.instance_variable_get(:@rock)).to be_a(RockAttendance)
  end
end