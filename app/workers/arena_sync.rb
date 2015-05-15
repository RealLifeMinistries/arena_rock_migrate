class ArenaSync
  include Sidekiq::Worker
  sidekiq_options queue: :arena, unique: true

  def perform
    ArenaRecordSync.perform_async(Arena::Address.name,ArenaAddress.name, :address_id)
    ArenaRecordSync.perform_async(Arena::Area.name,ArenaArea.name, :area_id)
    ArenaRecordSync.perform_async(Arena::Attribute.name,ArenaAttribute.name, :attribute_id)
    ArenaRecordSync.perform_async(Arena::AttributeGroup.name,ArenaAttributeGroup.name, :attribute_group_id)
    ArenaRecordSync.perform_async(Arena::Campus.name,ArenaCampus.name, :campus_id)
    ArenaRecordSync.perform_async(Arena::Family.name,ArenaFamily.name, :family_id)
    ArenaRecordSync.perform_async(Arena::FamilyMember.name,ArenaFamilyMember.name, :family_id, :person_id)
    ArenaRecordSync.perform_async(Arena::Lookup.name,ArenaLookup.name, :lookup_id)
    ArenaRecordSync.perform_async(Arena::LookupType.name,ArenaLookupType.name, :lookup_type_id)
    ArenaRecordSync.perform_async(Arena::Occurrence.name,ArenaOccurrence.name, :occurrence_id)
    ArenaRecordSync.perform_async(Arena::OccurrenceAttendance.name,ArenaOccurrenceAttendance.name, :occurrence_attendance_id)
    ArenaRecordSync.perform_async(Arena::OccurrenceAttendanceSmallGroup.name,ArenaOccurrenceAttendanceSmallGroup.name, :occurrence_id,:group_id)
    ArenaRecordSync.perform_async(Arena::OccurrenceAttendanceProfile.name,ArenaOccurrenceAttendanceProfile.name, :occurrence_id,:profile_id)
    ArenaRecordSync.perform_async(Arena::OccurrenceType.name,ArenaOccurrenceType.name, :occurrence_type_id)
    ArenaRecordSync.perform_async(Arena::Person.name,ArenaPerson.name, :person_id)
    ArenaRecordSync.perform_async(Arena::PersonAddress.name,ArenaPersonAddress.name, :person_id,:address_id,:address_type_luid)
    ArenaRecordSync.perform_async(Arena::PersonAttribute.name,ArenaPersonAttribute.name, :person_id,:attribute_id)
    ArenaRecordSync.perform_async(Arena::PersonEmail.name,ArenaPersonEmail.name, :email_id)
    ArenaRecordSync.perform_async(Arena::PersonPhone.name,ArenaPersonPhone.name, :person_id, :phone_luid)
    ArenaRecordSync.perform_async(Arena::Profile.name,ArenaProfile.name, :profile_id)
    ArenaRecordSync.perform_async(Arena::ProfileMember.name,ArenaProfileMember.name, :profile_id, :person_id)
    ArenaRecordSync.perform_async(Arena::RelationshipType.name,ArenaRelationshipType.name, :relationship_type_id)
    ArenaRecordSync.perform_async(Arena::Relationship.name,ArenaRelationship.name, :relationship_id)
    ArenaRecordSync.perform_async(Arena::SmallGroup.name,ArenaSmallGroup.name, :group_id)
    ArenaRecordSync.perform_async(Arena::SmallGroupCluster.name,ArenaSmallGroupCluster.name, :group_cluster_id)
    ArenaRecordSync.perform_async(Arena::SmallGroupMember.name,ArenaSmallGroupMember.name, :group_id,:person_id)
    ArenaRecordSync.perform_async(Arena::SmallGroupOccurrence.name,ArenaSmallGroupOccurrence.name, :group_id,:occurrence_id)
  end

end
