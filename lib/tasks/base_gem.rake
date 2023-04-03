# frozen_string_literal: true

namespace :base_gem do
  desc 'Runs the process and updates configurations based in the YML config file'
  task generate: :environment do
    puts 'Starting BaseGem generation process'
    # BaseGem::Orchestrator.new.run
    puts 'Process finished!'
  end
end
