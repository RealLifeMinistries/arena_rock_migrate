namespace :migrate do
  namespace :arena do
    namespace :sync_to_rock do
      
      task :people => :environment do
        ArenaPerson.find_each do |arena_person|
          arena_person.sync_to_rock!
        end
      end

      task :families => :environment do
        ArenaFamily.find_each do |arena_family|
          arena_family.sync_to_rock!
        end
      end

      task :attributes => :environment do
        ArenaAttribute.find_each do |arena_attribute|
          arena_attribute.sync_to_rock!
        end
      end

    end
  end
end
