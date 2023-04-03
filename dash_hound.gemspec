# frozen_string_literal: true

require_relative 'lib/base_gem/version'

Gem::Specification.new do |spec|
  spec.name          = 'base_gem'
  spec.version       = BaseGem::VERSION
  spec.authors       = ['Emanuel Merayo Goldenberg']
  spec.email         = ['emanuelmerayo@gmail.com']
  spec.summary     = 'Base Gem to be used when creating new gems'
  spec.description = 'This project provides a base implementation for setting up gems; it provides a base rake task and configuration'
  spec.homepage    = 'https://github.com/emerayo/base_gem'
  spec.required_ruby_version = '>= 2.7.5'

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files = Dir.chdir(File.expand_path(__dir__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  # end

  spec.files = Dir['{app,config,db,lib,vendor}/**/*', 'Rakefile', 'README.md']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
