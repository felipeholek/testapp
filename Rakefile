# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "SSH into a service. Defaults to 'web'."
task :ssh do
  service = ENV.fetch('SERVICE', 'web')
  sh "docker-compose exec #{service} bash"
end

desc 'Launch IRB'
task :irb do
  sh 'docker-compose exec web irb'
end

desc 'Run a Rails command, e.g. rake rails CMD=version'
task :rails do
  cmd = ENV.fetch('CMD', 'version')
  sh "docker-compose exec web rails #{cmd}"
end
