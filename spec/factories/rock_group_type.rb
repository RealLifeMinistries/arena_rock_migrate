
FactoryGirl.define do
  factory :RockGroupType do
    Id 1
    IsSystem false
    Name 'RockGroupType'
    GroupTerm 'GroupTerm'
    GroupMemberTerm 'GroupMemberTerm'
    AllowMultipleLocations false
    ShowInGroupList true
    ShowInNavigation true
    TakesAttendance false
    AttendanceRule 0
    AttendancePrintTo 0
    Order 0
    LocationSelectionMode 0
    Guid SecureRandom.uuid
  end
end