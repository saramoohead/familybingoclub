# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new :spec
RuboCop::RakeTask.new :cop
Cucumber::Rake::Task.new :cuke

task default: %i[spec cop cuke]