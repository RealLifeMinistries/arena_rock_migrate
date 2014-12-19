namespace :migrate do
  namespace :arena do
    namespace :sync_to_rock do
      task :all do
        [:people,:families,:attributes,:small_groups].each do |task|
          Rake::Task["migrate:arena:sync_to_rock:#{task.to_s}"].invoke
        end
      end
      
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
        ArenaPersonAttribute.find_each do |attribute|
          attribute.sync_to_rock!
        end
      end
      
      task :small_groups => :environment do
        ArenaSmallGroup.find_each do |group|
          group.sync_to_rock!
        end
      end

    end
  end
end
