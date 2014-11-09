# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'staple/version'

Gem::Specification.new do |spec|
  spec.name          = "staple"
  spec.version       = Staple::VERSION
  spec.authors       = ["Ryan Helsing"]
  spec.email         = ["ryan.helsing@centerian.com"]
  spec.description   = %q{Staple}
  spec.summary       = %q{Staple}
  spec.homepage      = "https://github.com/rhelsing/staple"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
