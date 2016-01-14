require 'colorize'

# Only rake tasks allowed to run on production
namespace :db do
  desc 'Update the DB structure & populate it'
  task :prod => :environment do
    puts 'Production Env'.colorize(:blue)
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end
end