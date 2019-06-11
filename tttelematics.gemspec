Gem::Specification.new do |s|
  s.name        = 'tttelematics'
  s.version     = '0.0.2'
  s.date        = '2019-06-11'
  s.summary     = 'a simple client for Tom Tom Telematics'
  s.description = 'A simple API wrapper for Tom Tom Telematics'
  s.authors     = ["Alexei Mamani"]
  s.email       = 'alexeim763@gmail.com'
  s.files       = Dir['lib/*.rb']
  s.homepage    = 'https://github.com/s-fleet/tom_tom_telematics'
  s.license     = 'MIT'

  s.add_development_dependency 'rubocop', '~> 0.71.0'

  s.add_runtime_dependency 'faraday', '~> 0.15.4'
  s.add_runtime_dependency 'json', '~> 2.2'
end
