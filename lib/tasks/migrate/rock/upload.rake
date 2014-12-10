namespace :migrate do
  namespace :rock do
    namespace :upload do
      task :all => %w{
        attributes
        attribute_categories
        attribute_qualifiers
        attribute_values
        categories
        defined_values
        groups
        group_members
        locations
        people
        person_aliases
        phone_numbers
      }

      task :attributes => :environment do
        RockAttribute.find_each do |record|
          attribute = Rock::Attribute.find_or_initialize_by(Id: record.Id)
          attribute.attributes = record.attributes

          if attribute.changes.any?
            attribute.save!
            puts "Uploaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :attribute_categories => :environment do
        # Issues with .find_each and Capitalized fields with multiple primary keys
        RockAttributeCategory.all.each do |record|
          ac = Rock::AttributeCategory.find_or_initialize_by({
            AttributeId: record.AttributeId,
            CategoryId: record.CategoryId
          })

          if ac.changes.any?
            #ac.save!
            # Have to work around TSQL issue
            Rock::AttributeCategory.connection.execute(
              "INSERT INTO [AttributeCategory] ([AttributeId], [CategoryId]) VALUES (#{ac.AttributeId},#{ac.CategoryId})" 
            )
            puts "Uploaded #{record.class.name}/#{record.AttributeId}:#{record.CategoryId}"
          end
        end
      end

      task :attribute_values => :environment do
        RockAttributeValue.find_each do |record|
          attribute_value = Rock::AttributeValue.find_or_initialize_by(Id: record.Id)
          attribute_value.attributes = record.attributes

          if attribute_value.changes.any?
            attribute_value.save!
            puts "Uploaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :attribute_qualifiers => :environment do
        RockAttributeQualifier.find_each do |record|
          attribute_qualifier = Rock::AttributeQualifier.find_or_initialize_by(Id: record.Id)
          attribute_qualifier.attributes = record.attributes

          if attribute_qualifier.changes.any?
            attribute_qualifier.save!
            puts "Uploaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :categories => :environment do
        RockCategory.find_each do |record|
          category = Rock::Category.find_or_initialize_by(Id: record.Id)
          category.attributes = record.attributes

          if category.changes.any?
            category.save!
            puts "Uploaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :defined_values => :environment do
        RockDefinedValue.find_each do |record|
          defined_value = Rock::DefinedValue.find_or_initialize_by(Id: record.Id)
          defined_value.attributes = record.attributes

          if defined_value.changes.any?
            defined_value.save!
            puts "Uploaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :groups => :environment do
        RockGroup.find_each do |record|
          group = Rock::Group.find_or_initialize_by(Id: record.Id)
          group.attributes = record.attributes

          if group.changes.any?
            group.save!
            puts "Uploaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :group_members => :environment do
        RockGroupMember.find_each do |record|
          group_member = Rock::GroupMember.find_or_initialize_by(Id: record.Id)
          group_member.attributes = record.attributes

          if group_member.changes.any?
            group_member.save!
            puts "Uploaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :people => :environment do
        RockPerson.find_each do |record|
          person = Rock::Person.find_or_initialize_by(Id: record.Id)
          person.attributes = record.attributes
          if person.changes.any?
            person.save!
            puts "Uploaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :person_aliases => :environment do
        RockPersonAlias.find_each do |record|
          palias = Rock::PersonAlias.find_or_initialize_by(Id: record.Id)
          palias.attributes = record.attributes

          if palias.changes.any?
            palias.save!
            puts "Uploaded #{record.class.name}/#{record.Id}"
          end
        end
      end

      task :phone_numbers => :environment do
        RockPhoneNumber.find_each do |record|
          pn = Rock::PhoneNumber.find_or_initialize_by(Id: record.Id)
          pn.attributes = record.attributes

          if pn.changes.any?
            pn.save!
            puts "Uploaded #{record.class.name}/#{record.Id}"
          end
        end
      end


    end
  end
end
