# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'recereco/version'

Gem::Specification.new do |spec|
  spec.name          = "recereco"
  spec.version       = Recereco::VERSION
  spec.authors       = ["gogotanaka"]
  spec.email         = ["tanaka@c-fo.com"]
  spec.description   = %q{get deal}
  spec.summary       = %q{get deal}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
