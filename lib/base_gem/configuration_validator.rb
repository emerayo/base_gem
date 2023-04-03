# frozen_string_literal: true

module BaseGem
  # Validates and normalizes a configuration.
  class ConfigurationValidator
    # Validates hash for any invalid options, normalizing where possible.
    #
    # @param hash [Hash] hash representation of YAML config
    # @return [BaseGem::Configuration]
    def validate(hash)
      ensure_sections_exist(hash)
      configuration_required_fields(hash)

      BaseGem::Configuration.new(hash)
    end

    private

    # Ensures that necessary keys exist (Configuration, APIs)
    def ensure_sections_exist(hash)
      BASE_CONFIGURATION_FILE_KEYS.each do |key|
        check_key_exists(hash, key)
        check_key_present(hash, key)
      end
    end

    def check_key_exists(hash, key, section = nil, subsection = nil)
      return if hash.key?(key)

      msg = "The key #{key} is missing from the configuration file"
      msg += ", in #{section.capitalize} section" if section
      msg += ", in subsection - #{subsection}" if subsection
      raise BaseGem::Exceptions::ConfigurationError, msg
    end

    def check_key_present(hash, key, section = nil, subsection = nil)
      return if hash[key].present?

      msg = "The key #{key} is blank in the configuration file"
      msg += ", in #{section.capitalize} section" if section
      msg += ", in subsection - #{subsection}" if subsection
      raise BaseGem::Exceptions::ConfigurationError, msg
    end

    def configuration_required_fields(hash)
      configuration = hash[CONFIGURATION]

      CONFIGURATION_KEYS.each do |key|
        check_key_exists(configuration, key, CONFIGURATION)
        check_key_present(configuration, key, CONFIGURATION)
      end
    end
  end
end
