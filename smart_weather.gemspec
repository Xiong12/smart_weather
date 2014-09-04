# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smart_weather/version'

Gem::Specification.new do |spec|
  spec.name          = "smart_weather"
  spec.version       = SmartWeather::VERSION
  spec.authors       = ["Spirit"]
  spec.email         = ["neverlandxy.naix@gmail.com"]
  spec.summary       = %q{中国气象网SmartWeatherAPI Ruby SDK}
  spec.description   = %q{中国气象网SmartWeatherAPI Ruby SDK}
  spec.homepage      = "https://github.com/awesome-api/smart_weather"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "restclient_api_base", "~> 0.1.1"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
