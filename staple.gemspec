# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "staple"
  spec.version       = "0.2.0"
  spec.summary       = "Modular UI framework for rails built on top of foundation and sass."
  spec.description   = "Modular UI framework for rails built on top of foundation and sass."
  spec.authors       = ["Ryan Helsing"]
  spec.email         = ["ryan.helsing@centerian.com"]
  spec.homepage      = "https://github.com/rhelsing/staple"
  spec.license       = "MIT"

  spec.add_dependency('foundation-rails', '~> 5.4')
  spec.add_dependency('simple_form', '~> 3.0')
  spec.add_dependency('font-awesome-rails', '~> 4.2')
  spec.add_dependency('slim-rails', '~> 2.1')

  # spec.add_development_dependency('rake')
  # spec.add_development_dependency('rspec')
  # spec.add_development_dependency('rdoc')
  # spec.add_development_dependency('bundler')

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end