require 'rspec'

describe 'ArenaSmallGroup cluster can sync to rock' do
  it 'Should create a RockGroup' do
    #small_groups = create_list(:PFArenaSmallGroup, 2)
    small_group_cluster = create(:PFAllRegionCluster, :small_groups)
    small_group_cluster.sync_to_rock!
    expect(small_group_cluster.groups.length).to be 5
    expect(small_group_cluster.instance_variable_get(:@rock).GroupTypeId).to be(RockGroupType::HOME_GROUP_ORG_UNIT)
    expect(small_group_cluster.instance_variable_get(:@rock)).to be_a(RockGroup)
    expect(small_group_cluster.instance_variable_get(:@rock).ParentGroupId).to be(RockGroup::SMALL_GROUPS)
  end
  it 'CDA Group Should create RockGroupType::HOME_GROUP_ORG_UNIT' do
    sgc = create(:CDARegionCluster)
    sgc.sync_to_rock!
    expect(sgc.instance_variable_get(:@rock).GroupTypeId).to be RockGroupType::HOME_GROUP_ORG_UNIT
  end
  it 'Other cluster group should be SMALL_GROUP_CLUSTER' do
    sgc = create(:OtherSmallGroupCluster)
    sgc.sync_to_rock!
    expect(sgc.instance_variable_get(:@rock).GroupTypeId).to be RockGroupType::SMALL_GROUP_CLUSTER
  end
  it 'should create admin_role' do
    sgc = create(:PFAllRegionCluster, :admin)
    sgc.sync_to_rock!
    expect(sgc.instance_variable_get(:@admin_role).GroupRoleId).to be(RockGroupTypeRole::SMALL_GROUP_CLUSTER_LEADER)
  end
  it 'should create leader_role' do
    sgc = create(:PFAllRegionCluster, :leader)
    sgc.sync_to_rock!
    expect(sgc.instance_variable_get(:@leader_role).GroupRoleId).to be(RockGroupTypeRole::SMALL_GROUP_CLUSTER_LEADER)
  end
end