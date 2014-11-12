# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'u2i/jenkins/matrix_project/version'

Gem::Specification.new do |spec|
  spec.name          = 'u2i-jenkins-matrix_project'
  spec.version       = U2I::Jenkins::MatrixProject::VERSION
  spec.authors       = ['Michal Knapik']
  spec.email         = ['michal.knapik@u2i.com']
  spec.summary       = %q{Example Jenkins project which works on multiple Ruby and ActiveSupport versions.}
  spec.description   = %q{.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  rails_version = ENV['RAILS_VERSION'] || 'default'

  if rails_version == 'default'
    spec.add_dependency 'activesupport'
  else
    spec.add_dependency 'activesupport', "~> #{rails_version}"
  end

  spec.add_dependency 'tzinfo'

  if rails_version != 'default' && rails_version < '3.0'
    if RUBY_VERSION >= '2.0'
      spec.add_dependency 'iconv'
    end
  end

  unless RUBY_VERSION < '1.9'
    spec.add_development_dependency 'guard'
    spec.add_development_dependency 'guard-rspec'
    spec.add_development_dependency 'guard-rubocop'
    spec.add_development_dependency 'rubocop', '~> 0.23'
    spec.add_development_dependency 'rubocop-checkstyle_formatter'
    spec.add_development_dependency 'metric_fu'
  end
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-rcov'
  spec.add_development_dependency 'simplecov-rcov-text'
  spec.add_development_dependency 'ci_reporter', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '< 3.0.0'

  spec.required_ruby_version     = '>= 1.8.7'
  spec.required_rubygems_version = '>= 1.8.25'
end
