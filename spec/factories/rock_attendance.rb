FactoryGirl.define do
  factory :RockAttendance do
    LocationId 1
    ScheduleId 1
    GroupId 1
    DeviceId 1
    SearchTypeValueId 1
    AttendanceCodeId 1
    QualifierValueId 1
    StartDateTime Time.new
    EndDateTime Time.new
    DidAttend true
    Note 'note note note'
    Guid SecureRandom.uuid
    PersonAliasId = 1
    RSVP = 1
  end
end