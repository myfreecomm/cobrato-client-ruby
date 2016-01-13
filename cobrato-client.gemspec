# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'cobrato/version'

Gem::Specification.new do |spec|
  spec.name          = "cobrato-client"
  spec.version       = Cobrato::VERSION
  spec.authors       = ["mrsantos"]
  spec.email         = ["mrsantos.caxias@gmail.com"]

  spec.summary       = %q{Official Ruby client for the Cobrato API.}
  spec.description   = %q{Official Ruby client for the Cobrato API. Cobrato is a receivables management system (for brazilian "boletos bancários").}
  spec.homepage      = "https://github.com/myfreecomm/cobrato-client-ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "typhoeus", "~> 0.7.2"
  spec.add_dependency "multi_json", "~> 1.11.1"
  spec.add_dependency "virtus", "~> 1.0.5"
  spec.add_dependency "wisper", "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'vcr', '~> 2.9.3'
  spec.add_development_dependency 'pry-byebug', '~> 2.0.0'
  spec.add_development_dependency 'pry-remote', '~> 0.1.8'
  spec.add_development_dependency 'rspec-rails', '~> 3.1.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.1'
  spec.add_development_dependency 'simplecov', '~> 0.9.1'
end
