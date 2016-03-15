require 'rails_helper'

describe Mapping, '#rock_record' do
  context 'when rock_record_id is nil' do
    it '@rock_record should be nil' do
      mapping = Mapping.new(nil, nil)
      expect(mapping.rock_record).to be_nil
    end
    it '@rock_record should be 1 when using ArenaOccurrenceAttendance' do
      record = create(:ArenaOccurrenceAttendance)
      mapping = Mapping.new(rock_record: record)
      expect(mapping.rock_record).to_not be_nil
      expect(mapping.rock_record.occurrence_id).to be(1)
    end
  end
end