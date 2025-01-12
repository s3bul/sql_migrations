# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sql_migrations/version'

Gem::Specification.new do |spec|
  spec.name          = 'sql_migrations'
  spec.version       = SqlMigrations::VERSION
  spec.authors       = ['Grzegorz Bizon']
  spec.email         = ['grzegorz.bizon@ntsn.pl']
  spec.summary       = 'Simple standalone migrations you can use with plain SQL'
  spec.homepage      = 'http://github.com/grzesiek/sql_migrations'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # rubocop:disable Style/SingleSpaceBeforeFirstArg
  spec.add_development_dependency 'rspec',   '~> 3.3'
  spec.add_development_dependency 'sqlite3', '~> 1.3.10'
  spec.add_development_dependency 'memfs',   '~> 0.4.3'
  spec.add_development_dependency 'rubocop', '~> 0.33'
  spec.add_development_dependency 'simplecov', '~> 0.10.0'
  spec.add_dependency             'bundler', '~> 1.7'
  spec.add_dependency             'rake',    '~> 10.0'
  spec.add_dependency             'sequel',  '~> 4.49.0'
  spec.add_dependency             'mysql2',  '~> 0.4.10'
  # rubocop:enable Style/SingleSpaceBeforeFirstArg
end
