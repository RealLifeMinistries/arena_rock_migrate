require 'rails_helper'

describe Mapping, '#rock_record' do
  context 'when rock_record_id is nil' do
    it '@rock_record should be nil' do
      mapping = Mapping.new(nil, nil)
      expect(mapping.rock_record).to be_nil
    end
  end

end