require 'rspec'

describe 'ArenaAddress can sync to rock' do
  it 'should set map to new mapping if mapping is nil' do
    address = FactoryGirl.create(:ArenaAddress)
    FactoryGirl.create(:RockGroupType)
    FactoryGirl.create(:RockGroup)
    FactoryGirl.create(:RockLocation)
    FactoryGirl.create(:RockGroupLocation)
    FactoryGirl.create(:RockDefinedType)
    FactoryGirl.create(:RockDefinedValue)
    address.mapping = nil
    address.sync_to_rock!
    expect(address.instance_variable_get(:@map)).to_not be_nil
  end
end