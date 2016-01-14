require 'colorize'

# All production tasks & tasks which can't be on the Prod
namespace :db do
  desc 'Recreate the DB structure & populate it'
  task :recreate => :environment do
    puts 'DBs creation'.colorize(:yellow)
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke

    puts 'Development Env'.colorize(:blue)
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke

    puts 'Test Env'.colorize(:green)
    system('rake db:migrate RAILS_ENV=test')
    system('rake db:seed RAILS_ENV=test --trace')
  end
end