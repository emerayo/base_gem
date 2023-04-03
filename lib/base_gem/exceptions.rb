# frozen_string_literal: true

module BaseGem
  class Exceptions
    # Base error class.
    class Error < StandardError; end

    # Raised when a {Configuration} could not be loaded from a file.
    class ConfigurationError < Error; end

    # Raised when a {Configuration} could not be loaded from a file.
    class MissingConfigurationFile < Error; end
  end
end
