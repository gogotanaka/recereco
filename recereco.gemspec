# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'recereco/version'

Gem::Specification.new do |spec|
  spec.name          = "recereco"
  spec.version       = Recereco::VERSION
  spec.authors       = ["gogotanaka"]
  spec.email         = ["tanaka@c-fo.com"]
  spec.description   = %q{ruby interface to the ReceReco API.}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = 'MIT'
  spec.files         = %w{LICENSE.txt README.md Rakefile zaim.gemspec}
  spec.files         += Dir.glob('lib/**/*.rb')
  spec.files         += Dir.glob('test/**/*')
  spec.test_files    = Dir.glob('test/**/*')
  spec.require_paths = ['lib']

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.2'
  spec.required_rubygems_version = '>= 1.3.5'

  spec.add_dependency 'faraday', ['~> 0.8', '< 0.9']
  spec.add_dependency 'faraday_middleware', '~> 0.9.0'
  spec.add_dependency 'simple_oauth', '~> 0.2'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
