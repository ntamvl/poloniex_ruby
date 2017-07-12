# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'poloniex_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "poloniex_ruby"
  spec.version       = PoloniexRuby::VERSION
  spec.authors       = ["Tam Nguyen"]
  spec.email         = ["ntamvl@gmail.com"]

  spec.summary       = %q{Poloniex API for Ruby on Rails}
  spec.description   = %q{Poloniex API for Ruby on Rails}
  spec.homepage      = "https://github.com/ntamvl/poloniex_ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'rest-client'
  spec.add_dependency 'addressable'
end
