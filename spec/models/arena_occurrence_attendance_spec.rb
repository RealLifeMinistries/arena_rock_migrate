require 'rspec'

describe 'ArenaAttendanceOccurrence can sync to rock' do
  it 'should set map to new mapping if mapping is nil' do
    attendance = create(:ArenaOccurrenceAttendance)
    attendance.mapping = nil
    attendance.rock_record = create(:RockAttendance)
    attendance.sync_to_rock!
  end
end