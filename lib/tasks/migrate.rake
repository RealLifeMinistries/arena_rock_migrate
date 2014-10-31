namespace :migrate do
  namespace :arena do
    namespace :download do

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

      task :family => :environment do
        Arena::Family.find_each do |record|
          family = ArenaFamily.find_or_initialize_by(family_id: record.family_id)
          family.attributes = record.attributes
          if family.changes.any? 
            family.save!
            puts "Downloaded #{record.class.name}/#{record.family_id}"
          end
        end
      end

    end
  end
end
