# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oletime/version'

Gem::Specification.new do |spec|
  spec.name          = 'oletime'
  spec.version       = Oletime::VERSION
  spec.authors       = ['Sandro Mehic']
  spec.email         = ['sandromehic@gmail.com']

  spec.summary       = 'Convert between OLE time and UNIX timestamp'
  spec.description   = 'Gem used for conversion of tim from OLE float '\
                       'datetime to UNIX timestamp and viceversa'
  spec.homepage      = 'https://github.com/sandromehic/oletime'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
