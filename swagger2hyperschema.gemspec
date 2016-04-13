# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swagger2hyperschema/version'

Gem::Specification.new do |spec|
  spec.name          = 'swagger2hyperschema'
  spec.version       = Swagger2hyperschema::VERSION
  spec.authors       = ['Fumiaki MATSUSHIMA']
  spec.email         = ['mtsmfm@gmail.com']

  spec.summary       = 'Convert swagger spec to json hyper schema'
  spec.description   = 'Convert swagger spec to json hyper schema'
  spec.homepage      = 'https://github.com/mtsmfm/swagger2hyperschema'

  spec.files         = `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'deka_eiwakun'
end
