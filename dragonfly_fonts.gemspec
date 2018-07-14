
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dragonfly_fonts/version'

Gem::Specification.new do |spec|
  spec.name          = 'dragonfly_fonts'
  spec.version       = DragonflyFonts::VERSION
  spec.authors       = ['Tomas Celizna']
  spec.email         = ['tomas.celizna@gmail.com']
  spec.summary       = 'Wraps common font-related tasks into Dragonfly analysers and processors.'
  spec.homepage      = 'https://github.com/tomasc/dragonfly_fonts'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'dragonfly', '~> 1.0'
  spec.add_dependency 'nokogiri'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'rake', '~> 10.0'
end
