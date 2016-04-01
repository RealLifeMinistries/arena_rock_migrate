require 'rspec'

describe 'ArenaSmallGroup can sync to rock' do
  it 'Should create a RockGroup with attendance small group type' do
    small_group = create(:PFArenaSmallGroup)
    small_group.sync_to_rock!
    expect(small_group.instance_variable_get(:@rock).GroupTypeId).to be(RockGroupType::ATTENDANCE_SMALL_GROUP)
    expect(small_group.instance_variable_get(:@rock)).to be_a(RockGroup)
  end
  it 'CDA Arena Small Group should have attendance grouptype' do
    sg = create(:CDAArenaSmallGroup)
    sg.sync_to_rock!
    expect(sg.instance_variable_get(:@rock).GroupTypeId).to be(RockGroupType::ATTENDANCE_SMALL_GROUP)
  end
  it 'other Small Group should have SMALL_GROUP grouptype' do
    sg = create (:OtherSmallGroup)
    sg.sync_to_rock!
    expect(sg.instance_variable_get(:@rock).GroupTypeId).to be(RockGroupType::SMALL_GROUP)
  end
  it 'Should contain PF memberships' do
    sg = create(:PFArenaSmallGroup, :memberships)
    sg.sync_to_rock!
    expect(sg.memberships.length).to equal 5
  end
  it 'should contain other memberships' do
    sg = create(:CDAArenaSmallGroup, :memberships_other)
    sg.sync_to_rock!
    expect(sg.memberships.first).to be_a(ArenaSmallGroupMember)
  end
end