require 'rspec'

describe 'ArenaAddress can sync to rock' do
  it 'should set map to new mapping if mapping is nil' do
    address = FactoryGirl.create(:ArenaAddress)

    address.mapping = nil
    address.sync_to_rock!
    expect(address.instance_variable_get(:@map)).to_not be_nil
    expect(address.instance_variable_get(:@rock)).to be_a(RockLocation)
    expect(address.instance_variable_get(:@rock).Street1).to eq('1234 main st')
  end
end