namespace :migrate do
  namespace :arena do
    namespace :download do
      task :all do
        sub_tasks = %w{
          addresses 
          areas
          attributes
          attribute_groups
          families
          family_members
          lookups
          lookup_types
          occurrences
          occurrence_attendance
          people
          person_addresses
          person_attributes
          person_emails
          person_phones
          profiles
          profile_members        
          relationship_types
          relationships
          small_groups
          small_group_clusters
          small_group_members
          small_group_occurrences
        }

        sub_tasks.each do |task|
          begin
            Rake::Task["migrate:arena:download:#{task}"].invoke
          rescue
            # try again if timed out
            Rake::Task["migrate:arena:download:#{task}"].invoke
          end
        end

      end

      task :addresses => :environment do
        Arena::Address.find_each(batch_size:100) do |record|
          address = ArenaAddress.find_or_initialize_by(address_id: record.address_id)
          address.attributes = record.attributes
          if address.changes.any?
            address.save!
            puts "Downloaded #{record.class.name}/#{record.address_id}"
          end
        end
      end

      task :areas => :environment do
        Arena::Area.find_each(batch_size:100) do |record|
          area = ArenaArea.find_or_initialize_by(area_id: record.area_id)
          area.attributes = record.attributes
          if area.changes.any?
            area.save!
            puts "Downloaded #{record.class.name}/#{record.area_id}"
          end
        end
      end

      task :attributes => :environment do
        Arena::Attribute.find_each(batch_size:100) do |record|
          attribute = ArenaAttribute.find_or_initialize_by(attribute_id: record.attribute_id)
          attribute.attributes = record.attributes
          if attribute.changes.any? 
            attribute.save!
            puts "Downloaded #{record.class.name}/#{record.attribute_id}"
          end
        end
      end

      task :attribute_groups => :environment do
        Arena::AttributeGroup.find_each(batch_size:100) do |record|
          attribute_group = ArenaAttributeGroup.find_or_initialize_by(attribute_group_id: record.attribute_group_id)
          attribute_group.attributes = record.attributes
          if attribute_group.changes.any? 
            attribute_group.save!
            puts "Downloaded #{record.class.name}/#{record.attribute_group_id}"
          end
        end
      end

      task :families => :environment do
        Arena::Family.find_each(batch_size:100) do |record|
          family = ArenaFamily.find_or_initialize_by(family_id: record.family_id)
          family.attributes = record.attributes
          if family.changes.any? 
            family.save!
            puts "Downloaded #{record.class.name}/#{record.family_id}"
          end
        end
      end

      task :family_members => :environment do
        Arena::FamilyMember.find_each(batch_size:100) do |record|
          family_member = ArenaFamilyMember.find_or_initialize_by(family_id: record.family_id, person_id: record.person_id)
          family_member.attributes = record.attributes
          if family_member.changes.any? 
            family_member.save!
            puts "Downloaded #{record.class.name}/#{record.family_id}:#{record.person_id}"
          end
        end
      end

      task :lookups => :environment do
        Arena::Lookup.find_each(batch_size:100) do |record|
          lookup = ArenaLookup.find_or_initialize_by(lookup_id: record.lookup_id)
          lookup.attributes = record.attributes
          if lookup.changes.any? 
            lookup.save!
            puts "Downloaded #{record.class.name}/#{record.lookup_id}"
          end
        end
      end

      task :lookup_types => :environment do
        Arena::LookupType.find_each(batch_size:100) do |record|
          lookup_type = ArenaLookupType.find_or_initialize_by(lookup_type_id: record.lookup_type_id)
          lookup_type.attributes = record.attributes
          if lookup_type.changes.any? 
            lookup_type.save!
            puts "Downloaded #{record.class.name}/#{record.lookup_type_id}"
          end
        end
      end

      task :occurrences => :environment do
        Arena::Occurrence.find_each(batch_size:100) do |record|
          occ = ArenaOccurrence.find_or_initialize_by(occurrence_id: record.occurrence_id)
          occ.attributes = record.attributes
          if occ.changes.any?
            occ.save!
            puts "Downloaded #{record.class.name}/#{record.occurrence_id}"
          end
        end
      end

      task :occurrence_attendance => :environment do
        Arena::OccurrenceAttendance.find_each(batch_size:100) do |record|
          occ = ArenaOccurrenceAttendance.find_or_initialize_by(occurrence_attendance_id: record.occurrence_attendance_id)
          occ.attributes = record.attributes
          if occ.changes.any?
            occ.save!
            puts "Downloaded #{record.class.name}/#{record.occurrence_attendance_id}"
          end
        end
      end

      task :people => :environment do
        Arena::Person.find_each(batch_size:100) do |record|
          person = ArenaPerson.find_or_initialize_by(person_id: record.person_id)
          person.attributes = record.attributes
          if person.changes.any?
            person.save!
            puts "Downloaded #{record.class.name}/#{record.person_id}"
          end
        end
      end

      task :person_addresses => :environment do
        Arena::PersonAddress.find_each(batch_size:100) do |record|
          address = ArenaPersonAddress.find_or_initialize_by(person_id: record.person_id, address_id: record.address_id, address_type_luid: record.address_type_luid)
          address.attributes = record.attributes
          if address.changes.any?
            address.save!
            puts "Downloaded #{record.class.name}/#{record.person_id}:#{record.address_id}:#{record.address_type_luid}"
          end
        end
      end

      task :person_attributes => :environment do
        Arena::PersonAttribute.find_each(batch_size:100) do |record|
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

      task :person_emails => :environment do
        Arena::PersonEmail.find_each(batch_size:100) do |record|
          email = ArenaPersonEmail.find_or_initialize_by(email_id: record.email_id)
          email.attributes = record.attributes
          if email.changes.any? 
            email.save!
            puts "Downloaded #{record.class.name}/#{record.email_id}"
          end
        end
      end

      task :person_phones => :environment do
        Arena::PersonPhone.find_each(batch_size:100) do |record|
          phone = ArenaPersonPhone.find_or_initialize_by(person_id: record.person_id, phone_luid: record.phone_luid)
          phone.attributes = record.attributes
          if phone.changes.any?
            phone.save!
            puts "Downloaded #{record.class.name}/#{record.person_id}:#{record.phone_luid}"
          end
        end
      end


      task :profiles => :environment do
        Arena::Profile.find_each(batch_size:100) do |record|
          profile = ArenaProfile.find_or_initialize_by(profile_id: record.profile_id)
          profile.attributes = record.attributes
          if profile.changes.any?
            profile.save!
            puts "Downloaded #{record.class.name}/#{record.profile_id}"
          end
        end
      end

      task :profile_members => :environment do
        Arena::ProfileMember.find_each(batch_size:100) do |record|
          profile_member = ArenaProfileMember.find_or_initialize_by(profile_id: record.profile_id, person_id: record.person_id)
          profile_member.attributes = record.attributes
          if profile_member.changes.any?
            profile_member.save!
            puts "Downloaded #{record.class.name}/#{record.profile_id}:#{record.person_id}"
          end
        end
      end

      task :relationship_types => :environment do
        Arena::RelationshipType.find_each(batch_size:100) do |record|
          rel_type = ArenaRelationshipType.find_or_initialize_by({
            relationship_type_id: record.relationship_type_id
          })
          rel_type.attributes = record.attributes
          if rel_type.changes.any?
            rel_type.save!
            puts "Synchonrized #{record.class.name}/#{record.relationship_type_id}"
          end
        end
      end

      task :relationships => :environment do
        Arena::Relationship.find_each(batch_size:100) do |record|
          rel = ArenaRelationship.find_or_initialize_by({
            relationship_id: record.relationship_id
          })
          rel.attributes = record.attributes
          if rel.changes.any?
            rel.save!
            puts "Synchonrized #{record.class.name}/#{record.relationship_id}"
          end
        end
      end

      task :small_groups => :environment do
        Arena::SmallGroup.find_each(batch_size:100) do |record|
          sg = ArenaSmallGroup.find_or_initialize_by({
            group_id: record.group_id
          })
          sg.attributes = record.attributes
          if sg.changes.any?
            sg.save!
            puts "Synchronized #{record.class.name}/#{record.group_id}"
          end
        end
      end

      task :small_group_clusters => :environment do
        Arena::SmallGroupCluster.find_each(batch_size:100) do |record|
          sgc = ArenaSmallGroupCluster.find_or_initialize_by({
            group_cluster_id: record.group_cluster_id
          })
          sgc.attributes = record.attributes
          if sgc.changes.any?
            sgc.save!
            puts "Synchronized #{record.class.name}/#{record.group_cluster_id}"
          end
        end
      end

      task :small_group_members => :environment do 
        Arena::SmallGroupMember.find_each(batch_size:100) do |record|
          sgm = ArenaSmallGroupMember.find_or_initialize_by({
            group_id: record.group_id,
            person_id: record.person_id
          })
          sgm.attributes = record.attributes
          if sgm.changes.any?
            sgm.save!
            puts "Synchronized #{record.class.name}/#{record.group_id}:#{record.person_id}"
          end
        end
      end

      task :small_group_occurrences => :environment do
        Arena::SmallGroupOccurrence.find_each(batch_size:100) do |record|
          sgo = ArenaSmallGroupOccurrence.find_or_initialize_by({
            group_id: record.group_id,
            occurrence_id: record.occurrence_id
          })
          if sgo.changes.any?
            sgo.save!
            puts "Synchronized #{record.class.name}/#{record.group_id}:#{record.occurrence_id}"
          end
        end
      end

    end
  end
end
