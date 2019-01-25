$:.push File.expand_path('lib', __dir__)

require 'mandrill_event/version'

Gem::Specification.new do |spec|
  spec.name        = 'mandrill_event'
  spec.version     = MandrillEvent::VERSION
  spec.authors     = ['Weston Triemstra']
  spec.email       = ['weston@netsign.com']
  spec.homepage    = 'https://github.com/netsign/mandrill_event'
  spec.summary     = 'Mandrill webhook integration for Rails.'
  spec.description = 'Mandrill webhook integration for Rails.'
  spec.license     = 'MIT'

  spec.files         = Dir['{app,config,lib}/**/*', 'LICENSE.md', 'README.md']
  spec.test_files    = Dir['spec/**/*']

  spec.add_dependency 'activesupport', '>= 3.1'

  spec.add_development_dependency 'rails', ['>= 3.1']
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'pry'
end
