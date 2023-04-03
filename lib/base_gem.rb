# frozen_string_literal: true

require 'base_gem/version'
require 'base_gem/constants'

require 'base_gem/railtie' if defined?(Rails)

module BaseGem
  autoload :ConfigurationLoader, 'base_gem/configuration_loader'
  autoload :ConfigurationValidator, 'base_gem/configuration_validator'
  autoload :Configuration, 'base_gem/configuration'
  autoload :Exceptions, 'base_gem/exceptions'
end
