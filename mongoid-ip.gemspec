# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid/ip/version'

Gem::Specification.new do |spec|
  spec.name          = "mongoid-ip"
  spec.version       = MongoidIp::VERSION
  spec.authors       = ["glebtv"]
  spec.email         = ["glebtv@gmail.com"]
  spec.summary       = %q{Storing IP in MongoDB done right - as integers}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/rs-pro/mongoid-ip"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'glebtv-mongoid-rspec'
  spec.add_development_dependency 'ffaker'
end
