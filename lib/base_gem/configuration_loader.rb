# frozen_string_literal: true

require 'yaml'

module BaseGem
  # Manages configuration file loading.
  class ConfigurationLoader
    CONFIG_FILE_NAME = '.base_gem.yml'

    class << self
      # Loads configuration from file.
      # @return [Hash]
      def hash_from_file
        YAML.load_file(CONFIG_FILE_NAME)
      rescue Errno::ENOENT
        raise BaseGem::Exceptions::MissingConfigurationFile,
              'Missing configuration file, run base_gem:install again'
      end
    end
  end
end
