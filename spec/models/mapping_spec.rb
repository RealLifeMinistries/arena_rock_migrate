require 'rails_helper'

describe Mapping, '#rock_record' do
    it '@rock_record should be nil' do
      mapping = Mapping.new(nil, nil)
      expect(mapping.rock_record).to be_nil
    end
    it '@rock_record should be Post Falls when using RockDefinedValue as mapping record' do
      record = create(:RockDefinedValue)
      mapping = Mapping.new(rock_record: record)
      expect(mapping.rock_record.Value).to eq('Post Falls')
    end
end

describe Mapping, '#arena_record' do
  it '@arena_record should be nil' do
    mapping = Mapping.new(arena_record: nil)
    expect(mapping.arena_record).to be_nil
  end
  it '@arena_record should be an ArenaAddress object' do
    record = create(:ArenaAddress)
    mapping = Mapping.new(arena_record: record)
    expect(mapping.arena_record).to be_a(ArenaAddress)
  end
end