# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fentis/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = ">= #{Fentis::RUBY_VERSION}"
  spec.name          = "fentis"
  spec.version       = Fentis::VERSION
  spec.authors       = ["Dave Ferris"]
  spec.email         = ["davidmferris@gmail.com"]
  spec.license       = "MIT"
  spec.summary       = "Rails app builder"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['fentis']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "rails", "~> #{Fentis::RAILS_VERSION}"
  spec.add_dependency "thor"
end
