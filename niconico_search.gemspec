# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'niconico_search/version'

Gem::Specification.new do |spec|
  spec.name          = "niconico_search"
  spec.version       = NiconicoSearch::VERSION
  spec.authors       = ["h3poteto"]
  spec.email         = ["h3.poteto@gmail.com"]

  spec.summary       = %q{A gem for niconico snapshot search api v2.}
  spec.description   = %q{A gem for niconico snapshot search api v2.}
  spec.homepage      = "https://github.com/h3poteto/niconico_search"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "activesupport"
end
