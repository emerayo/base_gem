# frozen_string_literal: true

require 'rails/generators'

module BaseGem
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def create_initializer
        template 'configuration.yml', '.base_gem.yml'
      end
    end
  end
end
