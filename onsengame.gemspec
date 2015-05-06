# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'onsengame/version'

Gem::Specification.new do |spec|
  spec.name          = "onsengame"
  spec.version       = Onsengame::VERSION
  spec.authors       = ["Masafumi Yokoyama"]
  spec.email         = ["myokoym@gmail.com"]
  spec.description   = %q{A 2D game framework using Gosu with Ruby.}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/myokoym/onsengame"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("gosu")
  spec.add_runtime_dependency("thor")
  spec.add_runtime_dependency("inplace")

  spec.add_development_dependency("test-unit")
  spec.add_development_dependency("bundler")
  spec.add_development_dependency("rake")
end
