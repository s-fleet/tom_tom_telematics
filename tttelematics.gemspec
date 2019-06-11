lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'TTTelematics/version'

Gem::Specification.new do |s|
  s.name        = 'tttelematics'
  s.version     = TTTelematics::VERSION
  s.date        = '2019-06-11'
  s.summary     = 'a simple client for Tom Tom Telematics'
  s.description = 'A simple API wrapper for Tom Tom Telematics'
  s.authors     = ["Alexei Mamani"]
  s.email       = 'alexeim763@gmail.com'
  s.files       = Dir.glob("lib/**/*.rb") + %w(LICENSE README.md)
  s.homepage    = 'https://github.com/s-fleet/tom_tom_telematics'
  s.license     = 'MIT'
  s.require_paths = ['lib']

  s.add_development_dependency 'rubocop', '~> 0.71.0'

  s.add_runtime_dependency 'faraday', '~> 0.15.4'
  s.add_runtime_dependency 'json', '~> 2.2'
end
