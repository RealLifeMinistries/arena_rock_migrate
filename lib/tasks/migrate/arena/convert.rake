namespace :migrate do
  namespace :arena do
    namespace :convert do
      task :all do
        [:people,:families,:attributes,:small_groups,:attendance,:profiles].each do |task|
          Rake::Task["migrate:arena:convert:#{task.to_s}"].invoke
        end
      end

      task :attendance => :environment do
        ArenaOccurrenceAttendance.order(:occurrence_attendance_id).find_each do |record|
          #pk = record.occurrence_attendance_id
          #if pk > last_id
            record.sync_to_rock! false
          #  Rails.cache.write(key,pk)
          #end
          #puts pk
        end
      end
      
      task :people => :environment do
        ArenaPerson.find_each do |arena_person|
          arena_person.sync_to_rock!
        end
      end

      task :families => :environment do
#        errors = []
        ArenaFamily.find_each do |arena_family|
#          begin
            arena_family.sync_to_rock!
#          rescue Exception => e
#            errors << e.message
#          end
        end
#        puts errors.join('\n')
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

      task :profiles => :environment do
        ArenaProfile.find_each do |group|
          group.sync_to_rock!
        end
      end

    end
  end
end
