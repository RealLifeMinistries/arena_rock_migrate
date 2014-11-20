namespace :migrate do
  namespace :arena do
    namespace :sync do
      
      task :people => :environment do
        ArenaPerson.find_each do |arena_person|
          arena_person.sync_to_rock!
        end
      end

    end
  end
end
