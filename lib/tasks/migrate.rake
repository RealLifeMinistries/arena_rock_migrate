namespace :migrate do
  task :download_and_convert => :environment do
    puts "Downloading from Arena"
    Rake::Task["migrate:arena:download:all"].invoke
    puts "Downloading from Rock"
    Rake::Task["migrate:rock:download:all"].invoke
    puts "Converting to Rock Data schema"
    Rake::Task["migrate:arena:convert:all"].invoke
  end
end
