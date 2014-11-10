require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

require 'ci/reporter/rake/rspec'

unless RUBY_VERSION < '1.9'
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new(:rubocop)
end

RSpec::Core::RakeTask.new(:spec)
