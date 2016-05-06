class RockSync
  include Sidekiq::Worker
  sidekiq_options queue: :rock, unique: :until_and_while_executing

  def perform
    [
      [RockDefinedType,Rock::DefinedType,["Id"]],
      [RockDefinedValue,Rock::DefinedValue,["Id"]],
      [RockPerson,Rock::Person,["Id"]],
      [RockPersonAlias,Rock::PersonAlias,["Id"]],
      [RockPhoneNumber,Rock::PhoneNumber,["Id"]],
      [RockCategory,Rock::Category,["Id"]],
      [RockAttribute,Rock::Attribute,["Id"]],
      [RockAttributeCategory,Rock::AttributeCategory,["AttributeId","CategoryId"]],
      [RockAttributeValue,Rock::AttributeValue,["Id"]],
      [RockAttributeQualifier,Rock::AttributeQualifier,["Id"]],
      [RockGroupType,Rock::GroupType,["Id"]],
      [RockGroupTypeRole,Rock::GroupTypeRole,["Id"]],
      [RockGroupType,Rock::GroupType,["Id"]],
      [RockGroup,Rock::Group,["Id"]],
      [RockGroupMember,Rock::GroupMember,["Id"]],
      [RockSchedule,Rock::Schedule,["Id"]],
      [RockAttendance,Rock::Attendance,["Id"]],
      [RockCampus, Rock::Campus,["Id"]],
      [RockPrayerRequest, Rock::PrayerRequest,["Id"]],
      [RockNote, Rock::Note, ["Id"]],
      # Photos
      # Relationships
      # Baptisms
      # Previous Names
    ].each do |klass1,klass2,keys|
      RockRecordSync.perform_async(klass1.name,klass2.name,*keys)
    end
  end

end
