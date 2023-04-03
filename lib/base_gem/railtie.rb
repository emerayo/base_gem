# frozen_string_literal: true

module BaseGem
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/base_gem.rake'
    end
  end
end
