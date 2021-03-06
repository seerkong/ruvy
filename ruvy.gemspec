# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruvy/version'

Gem::Specification.new do |spec|
  spec.name          = "ruvy"
  spec.version       = Ruvy::VERSION
  spec.authors       = ["DAddYE"]
  spec.email         = ["info@daddye.it"]
  spec.description   = "LibUV for Ruby"
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/DAddYE/ruvy"
  spec.license       = "MIT"
  spec.files         = []

  if RUBY_PLATFORM =~ /java/
    spec.platform = "java"
  else
    spec.extensions = Dir["ext/Rakefile"]
    spec.files += Dir["ext/libuv/**/*.{c,h,mk,d}"] -
      Dir["ext/libuv/test/*"] +
      Dir["ext/libuv/LICENSE"] +
      Dir["ext/libuv/Makefile"]
  end

  spec.files        += Dir['lib/**/*.rb']
  spec.files        += %w[README.md LICENSE.txt]
  spec.executables   = Dir['bin/**/*']
  spec.test_files    = Dir['test/**/*.rb']
  spec.require_paths = ["lib"]

  spec.add_dependency "ffi", "~>1.9.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
