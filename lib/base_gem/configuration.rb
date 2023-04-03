# frozen_string_literal: true

module BaseGem
  class Configuration
    attr_reader :hash

    def initialize(hash)
      @hash = hash
    end

    def application_name
      @application_name ||= configuration['application_name']
    end

    def api_key
      @api_key ||= configuration['api_key']
    end

    def application_key
      @application_key ||= configuration['application_key']
    end

    private

    def configuration
      hash[CONFIGURATION]
    end
  end
end
