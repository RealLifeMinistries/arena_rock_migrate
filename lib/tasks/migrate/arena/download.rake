namespace :migrate do
  namespace :arena do
    namespace :download do
      task :all => %w{
        addresses attributes attribute_groups families family_members
        lookups lookup_types people person_attributes
      }

      task :addresses => :environment do
        Arena::Address.find_each do |record|
          address = ArenaAddress.find_or_initialize_by(address_id: record.address_id)
          address.attributes = record.attributes
          if address.changes.any?
            address.save!
            puts "Downloaded #{record.class.name}/#{record.address_id}"
          end
        end
      end

      task :areas => :environment do
        Arena::Area.find_each do |record|
          area = ArenaArea.find_or_initialize_by(area_id: record.area_id)
          area.attributes = record.attributes
          if area.changes.any?
            area.save!
            puts "Downloaded #{record.class.name}/#{record.area_id}"
          end
        end
      end

      task :attributes => :environment do
        Arena::Attribute.find_each do |record|
          attribute = ArenaAttribute.find_or_initialize_by(attribute_id: record.attribute_id)
          attribute.attributes = record.attributes
          if attribute.changes.any? 
            attribute.save!
            puts "Downloaded #{record.class.name}/#{record.attribute_id}"
          end
        end
      end

      task :attribute_groups => :environment do
        Arena::AttributeGroup.find_each do |record|
          attribute_group = ArenaAttributeGroup.find_or_initialize_by(attribute_group_id: record.attribute_group_id)
          attribute_group.attributes = record.attributes
          if attribute_group.changes.any? 
            attribute_group.save!
            puts "Downloaded #{record.class.name}/#{record.attribute_group_id}"
          end
        end
      end

      task :families => :environment do
        Arena::Family.find_each do |record|
          family = ArenaFamily.find_or_initialize_by(family_id: record.family_id)
          family.attributes = record.attributes
          if family.changes.any? 
            family.save!
            puts "Downloaded #{record.class.name}/#{record.family_id}"
          end
        end
      end

      task :family_members => :environment do
        Arena::FamilyMember.find_each do |record|
          family_member = ArenaFamilyMember.find_or_initialize_by(family_id: record.family_id, person_id: record.person_id)
          family_member.attributes = record.attributes
          if family_member.changes.any? 
            family_member.save!
            puts "Downloaded #{record.class.name}/#{record.family_id}:#{record.person_id}"
          end
        end
      end

      task :lookups => :environment do
        Arena::Lookup.find_each do |record|
          lookup = ArenaLookup.find_or_initialize_by(lookup_id: record.lookup_id)
          lookup.attributes = record.attributes
          if lookup.changes.any? 
            lookup.save!
            puts "Downloaded #{record.class.name}/#{record.lookup_id}"
          end
        end
      end

      task :lookup_types => :environment do
        Arena::LookupType.find_each do |record|
          lookup_type = ArenaLookupType.find_or_initialize_by(lookup_type_id: record.lookup_type_id)
          lookup_type.attributes = record.attributes
          if lookup_type.changes.any? 
            lookup_type.save!
            puts "Downloaded #{record.class.name}/#{record.lookup_type_id}"
          end
        end
      end

      task :person_addresses => :environment do
        Arena::PersonAddress.find_each do |record|
          address = ArenaPersonAddress.find_or_initialize_by(person_id: record.person_id, address_id: record.address_id, address_type_luid: person.address_type_luid)
          address.attributes = record.attributes
          if address.changes.any?
            address.save!
            puts "Downloaded #{record.class.name}/#{record.person_id}:#{record.address_id}:#{record.address_type_luid}"
          end
        end
      end

      task :person_emails => :environment do
        Arena::PersonEmail.find_each do |record|
          email = ArenaPersonEmail.find_or_initialize_by(email_id: record.email_id)
          email.attributes = record.attributes
          if email.changes.any? 
            email.save!
            puts "Downloaded #{record.class.name}/#{record.email_id}"
          end
        end
      end

      task :person_phones => :environment do
        Arena::PersonPhone.find_each do |record|
          phone = ArenaPersonPhone.find_or_initialize_by(person_id: record.person_id, phone_luid: record.phone_luid)
          phone.attributes = record.attributes
          if phone.changes.any?
            phone.save!
            puts "Downloaded #{record.class.name}/#{record.phone_id}:#{record.person_id}"
          end
        end
      end

      task :occurrences => :environment do
        Arena::Occurrence.find_each do |record|
          occ = ArenaOccurrence.find_or_initialize_by(occurrence_id: record.occurrence_id)
          occ.attributes = record.attributes
          if occ.changes.any?
            occ.save!
            puts "Downloaded #{record.class.name}/#{record.occurrence_id}"
          end
        end
      end

      task :occurrence_attendance => :environment do
        Arena::OccurrenceAttendance.find_each do |record|
          occ = ArenaOccurrenceAttendance.find_or_initialize_by(occurrence_attendance_id: record.occurrence_attendance_id)
          occ.attributes = record.attributes
          if occ.changes.any?
            occ.save!
            puts "Downloaded #{record.class.name}/#{record.occurrence_attendance_id}"
          end
        end
      end

      task :people => :environment do
        Arena::Person.find_each do |record|
          person = ArenaPerson.find_or_initialize_by(person_id: record.person_id)
          person.attributes = record.attributes
          if person.changes.any?
            person.save!
            puts "Downloaded #{record.class.name}/#{record.person_id}"
          end
        end
      end

      task :profiles => :environment do
        Arena::Profile.find_each do |record|
          profile = ArenaProfile.find_or_initialize_by(profile_id: record.profile_id)
          profile.attributes = record.attributes
          if profile.changes.any?
            profile.save!
            puts "Downloaded #{record.class.name}/#{record.profile_id}"
          end
        end
      end

      task :profile_members => :environment do
        Arena::ProfileMember.find_each do |record|
          profile_member = ArenaProfileMember.find_or_initialize_by(profile_id: record.profile_id, person_id: record.person_id)
          profile_member.attributes = record.attributes
          if profile_member.changes.any?
            profile_member.save!
            puts "Downloaded #{record.class.name}/#{record.profile_id}:#{record.person_id}"
          end
        end
      end

      task :person_attributes => :environment do
        Arena::PersonAttribute.find_each do |record|
          person_attr = ArenaPersonAttribute.find_or_initialize_by({
            person_id: record.person_id,
            attribute_id: record.attribute_id 
          })
          person_attr.attributes = record.attributes
          if person_attr.changes.any? 
            person_attr.save!
            puts "Synchronized #{record.person_id}/#{record.attribute_id}"
          end
        end
      end

    end
  end
end
