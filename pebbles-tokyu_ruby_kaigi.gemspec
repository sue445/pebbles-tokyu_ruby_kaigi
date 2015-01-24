# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pebbles/tokyu_ruby_kaigi/version'

Gem::Specification.new do |spec|
  spec.name          = "pebbles-tokyu_ruby_kaigi"
  spec.version       = Pebbles::TokyuRubyKaigi::VERSION
  spec.authors       = ["sue445"]
  spec.email         = ["sue445@sue445.net"]
  spec.summary       = %q{Find target day of TokyuRubyKaigi}
  spec.description   = %q{Find target day of TokyuRubyKaigi}
  spec.homepage      = "https://github.com/sue445/pebbles-tokyu_ruby_kaigi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 4.0.0"
  spec.add_dependency "holiday_japan"
  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", ">= 1.5"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "delorean"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "3.1.0"
  spec.add_development_dependency "rspec-its"
end
