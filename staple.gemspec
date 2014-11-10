# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "staple"
  spec.version       = "0.0.3"
  spec.summary       = "a high level ui generator (COMING SOON)"
  spec.description   = "Does not work yet. Coming Soon. Built on top of foundation. In the spirit of thoughtbot/refills"
  spec.authors       = ["Ryan Helsing"]
  spec.email         = ["ryan.helsing@centerian.com"]
  spec.homepage      = "https://github.com/rhelsing/staple"
  spec.license       = "MIT"

  spec.add_runtime_dependency 'font-awesome-rails', '~> 4.2', '>= 4.2.0.0'
  spec.add_runtime_dependency 'foundation-rails', '~> 5.4', '>= 5.4.5.0'
  spec.add_runtime_dependency 'simple_form', '~> 3.0', '>= 3.0.2'
  spec.add_runtime_dependency 'slim-rails', '~> 2.1', '>= 2.1.0'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end