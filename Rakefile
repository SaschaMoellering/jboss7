require 'bundler/setup'

# chefspec
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:unit)

# rubocop
require 'rubocop/rake_task'
desc 'Run Ruby style checks'
Rubocop::RakeTask.new(:style)

# foodcritic
require 'foodcritic'
FoodCritic::Rake::LintTask.new

# test-kitchen
begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end
