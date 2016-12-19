# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cobrato/version'

Gem::Specification.new do |spec|
  spec.name          = "cobrato-client"
  spec.version       = Cobrato::VERSION
  spec.authors       = ["Marcio Ricardo Santos", "Rodrigo Tassinari de Oliveira", "Hugo Maia Vieira"]
  spec.email         = ["mrsantos.caxias@gmail.com", "rodrigo@pittlandia.net", "hugomaiavieira@gmail.com"]

  spec.summary       = %q{This is the official Ruby client for the Cobrato API.}
  spec.description   = %q{This is the official Ruby client for the Cobrato API. See https://app.cobrato.com for more information.}
  spec.homepage      = "https://github.com/myfreecomm/cobrato-client-ruby/"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "typhoeus", "~> 0.8.0"
  spec.add_dependency "multi_json", "~> 1.11.2"
  spec.add_dependency "virtus", "~> 1.0.5"
  spec.add_dependency "wisper", "~> 1.6.1"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency 'vcr', '~> 2.9'
  spec.add_development_dependency 'pry-byebug', '~> 3.1'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
  spec.add_development_dependency 'simplecov', '~> 0.10'
end
