# frozen_string_literal: true

require 'spec_helper'

require 'base_gem/exceptions'

require 'base_gem/configuration_loader'

describe BaseGem::ConfigurationLoader do
  describe '.hash_from_file' do
    subject { described_class.hash_from_file }

    let(:constant) { 'BaseGem::ConfigurationLoader::CONFIG_FILE_NAME' }

    context 'when the file is present' do
      it 'validates configuration correctly' do
        stub_const(constant, 'lib/generators/base_gem/templates/configuration.yml')

        expect(subject).not_to be_empty
      end
    end

    context 'when the file is missing' do
      it 'raises an error' do
        stub_const(constant, 'missing.yml')

        expect { subject }.to raise_error(
          BaseGem::Exceptions::MissingConfigurationFile,
          'Missing configuration file, run base_gem:install again'
        )
      end
    end
  end
end
