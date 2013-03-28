# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lograge_tagged/version'

Gem::Specification.new do |gem|
  gem.name          = "lograge-tagged"
  gem.version       = LogrageTagged::VERSION
  gem.authors       = ["Simone Carletti"]
  gem.email         = ["weppos@weppos.net"]
  gem.summary       = %q{A tagged LogSubscriber for Lograge}
  gem.description   = %q{A tagged LogSubscriber for Lograge.}
  gem.homepage      = "https://github.com/aetrion/lograge-tagged"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "lograge", "~> 0.2"
  gem.add_development_dependency "rspec"
end
