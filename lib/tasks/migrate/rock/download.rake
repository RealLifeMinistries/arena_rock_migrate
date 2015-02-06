namespace :migrate do
  namespace :rock do
    namespace :download do
      task :all => %w{
        attendance
        attributes
        attribute_categories
        attribute_qualifiers
        attribute_values
        campuses
        categories 
        defined_types
        defined_values
        entity_types
        field_types
        groups
        group_locations
        group_members
        group_types
        group_type_roles
        locations
        people
        person_aliases
        phone_numbers
        schedules
      }

      task :attendance => :environment do
        Rock::Attendance.find_each do |record|
          att = RockAttendance.find_or_initialize_by(Id: record.Id)
          att.attributes = record.attributes

          if att.changes.any?
            att.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end
      
      task :attributes => :environment do
        Rock::Attribute.find_each do |record|
          attribute = RockAttribute.find_or_initialize_by(Id: record.Id)

          if attribute.persisted? && attribute.Guid != record.Guid
            puts "Attribute Mismatch: #{attribute.inspect}"
            attribute.mapping.destroy if attribute.mapping
            attribute.destroy
            next
          end

          attribute.attributes = record.attributes
          if attribute.changes.any?
            attribute.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :attribute_categories => :environment do
        Rock::AttributeCategory.find_each do |record|
          attr_cat = RockAttributeCategory.find_or_initialize_by(AttributeId: record.AttributeId, CategoryId: record.CategoryId)
          attr_cat.attributes = record.attributes

          if attr_cat.changes.any?
            attr_cat.save!
            puts "Downloaded #{record.class.name}/#{record.AttributeId}:#{record.CategoryId}"
          end
        end
      end

      task :attribute_values => :environment do
        Rock::AttributeValue.find_each do |record|
          attribute_value = RockAttributeValue.find_or_initialize_by(Id: record.Id)

          if attribute_value.persisted? && attribute_value.Guid != record.Guid
            puts "Attribute Value Mismatch: #{attribute_value.inspect}"
            attribute_value.mapping.destroy if attribute_value.mapping
            attribute_value.destroy
            next
          end

          attribute_value.attributes = record.attributes

          if attribute_value.changes.any?
            attribute_value.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :attribute_qualifiers => :environment do
        Rock::AttributeQualifier.find_each do |record|
          attribute_qualifier = RockAttributeQualifier.find_or_initialize_by(Id: record.Id)
          attribute_qualifier.attributes = record.attributes

          if attribute_qualifier.changes.any?
            attribute_qualifier.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :campuses => :environment do
        Rock::Campus.find_each do |record|
          campus = RockCampus.find_or_initialize_by(Id: record.Id)
          campus.attributes = record.attributes

          if campus.changes.any?
            campus.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :categories => :environment do
        Rock::Category.find_each do |record|
          category = RockCategory.find_or_initialize_by(Id: record.Id)
          category.attributes = record.attributes

          if category.changes.any?
            category.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :defined_types => :environment do
        Rock::DefinedType.find_each do |record|
          defined_type = RockDefinedType.find_or_initialize_by(Id: record.Id)
          defined_type.attributes = record.attributes

          if defined_type.changes.any?
            defined_type.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :defined_values => :environment do
        Rock::DefinedValue.find_each do |record|
          defined_value = RockDefinedValue.find_or_initialize_by(Id: record.Id)
          defined_value.attributes = record.attributes

          if defined_value.changes.any?
            defined_value.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :entity_types => :environment do
        Rock::EntityType.find_each do |record|
          entity_type = RockEntityType.find_or_initialize_by(Id: record.Id)
          entity_type.attributes = record.attributes
          
          if entity_type.changes.any?
            entity_type.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :field_types => :environment do
        Rock::FieldType.find_each do |record|
          field_type = RockFieldType.find_or_initialize_by(Id: record.Id)
          field_type.attributes = record.attributes

          if field_type.changes.any?
            field_type.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :groups => :environment do
        Rock::Group.find_each do |record|
          group = RockGroup.find_or_initialize_by(Id: record.Id)
          group.attributes = record.attributes

          if group.changes.any?
            group.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :group_locations => :environment do
        Rock::GroupLocation.find_each do |record|
          group_location = RockGroupLocation.find_or_initialize_by(Id: record.Id)
          group_location.attributes = record.attributes

          if group_location.changes.any?
            group_location.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :group_members => :environment do
        Rock::GroupMember.find_each do |record|
          group_member = RockGroupMember.find_or_initialize_by(Id: record.Id)
          group_member.attributes = record.attributes

          if group_member.changes.any?
            group_member.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :group_types => :environment do
        Rock::GroupType.find_each do |record|
          group_type = RockGroupType.find_or_initialize_by(Id: record.Id)
          group_type.attributes = record.attributes

          if group_type.changes.any?
            group_type.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :group_type_roles => :environment do
        Rock::GroupTypeRole.find_each do |record|
          group_type_role = RockGroupTypeRole.find_or_initialize_by(Id: record.Id)
          group_type_role.attributes = record.attributes

          if group_type_role.changes.any?
            group_type_role.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :locations => :environment do 
        Rock::Location.find_each do |record|
          location = RockLocation.find_or_initialize_by(Id: record.Id)
          location.attributes = record.attributes

          if location.changes.any?
            location.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :people => :environment do
        Rock::Person.find_each do |record|
          person = RockPerson.find_or_initialize_by(Id: record.Id)
          person.attributes = record.attributes

          if person.changes.any?
            person.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :person_aliases => :environment do
        Rock::PersonAlias.find_each do |record|
          palias = RockPersonAlias.find_or_initialize_by(Id: record.Id)
          palias.attributes = record.attributes

          if palias.changes.any?
            palias.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :phone_numbers => :environment do
        Rock::PhoneNumber.find_each do |record|
          pn = RockPhoneNumber.find_or_initialize_by(Id: record.Id)
          pn.attributes = record.attributes

          if pn.changes.any?
            pn.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :schedules => :environment do
        Rock::Schedule.find_each do |record|
          s = RockSchedule.find_or_initialize_by(Id: record.Id)
          s.attributes = record.attributes
            sleep 0.5

          if s.changes.any?
            s.save!
            puts "Downloaded #{record.class.name}/#{record.Id}"
          end
        end
      end

    end
  end
end
