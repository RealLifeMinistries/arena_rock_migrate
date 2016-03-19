require 'rspec'

describe 'ArenaOccurrenceType can sync to rock' do
  it 'PFWeekendOnline should create new RockAttendance with ID WEEKEND_WORSHIP_SERVICE_GROUP ' do
    occurrence_type = create(:PFWeekendOnline)
    occurrence_type.sync_to_rock!
    #expect(occurrence_type.instance_variable_get(:@rock).group.id).to be WEEKEND_WORSHIP_SERVICE_GROUP
  end
  it 'PFWeekendOnline should create new RockAttendance with ID CDA_WEEKEND_WORSHIP_SERVICE_GROUP' do
    occurrence_type = create(:CDAWeekendWorship)
    occurrence_type.sync_to_rock!
    #expect(occurrence_type.instance_variable_get(:@rock).group.id).to be CDA_WEEKEND_WORSHIP_SERVICE_GROUP
  end
end