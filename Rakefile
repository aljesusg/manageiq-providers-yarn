require 'bundler/setup'
require 'bundler/gem_tasks'

begin
  require 'rspec/core/rake_task'

  APP_RAKEFILE = File.expand_path("../spec/manageiq/Rakefile", __FILE__)
  load 'rails/tasks/engine.rake'
rescue LoadError
end

namespace :spec do
  desc "Setup environment for specs"
  task :setup => 'app:test:providers:vmware:setup'
end

desc "Run all vmware specs"
task :spec => 'app:test:providers:vmware'

task :default => :spec
