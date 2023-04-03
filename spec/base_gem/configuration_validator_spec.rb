# frozen_string_literal: true

require 'spec_helper'

require 'base_gem/constants'
require 'base_gem/configuration'
require 'base_gem/exceptions'

require 'base_gem/configuration_validator'
require 'yaml'

describe BaseGem::ConfigurationValidator do
  describe '#validate' do
    let(:hash) { YAML.load_file('lib/generators/base_gem/templates/configuration.yml') }
    let(:valid_hash) do
      {
        'configuration' => {
          'application_name' => 'application_name',
          'api_key' => 'api_key',
          'application_key' => 'application_key'
        }
      }
    end

    subject { described_class.new.validate(hash) }

    context 'when the hash is valid' do
      it 'validates configuration correctly' do
        expect(subject.hash).to eq(valid_hash)
      end
    end

    context 'when base keys are missing' do
      [BaseGem::CONFIGURATION].each do |base_key|
        context "when the hash does not contain the #{base_key} key" do
          before do
            hash.delete(base_key)
          end

          it "raises an error if the #{base_key} is missing" do
            expect { subject }.to raise_error(
              BaseGem::Exceptions::ConfigurationError,
              "The key #{base_key} is missing from the configuration file"
            )
          end
        end

        context "when the #{base_key} section doesn't contain at least one value" do
          before do
            hash[base_key] = {}
          end

          it 'raises an error' do
            expect { subject }.to raise_error(
              BaseGem::Exceptions::ConfigurationError,
              "The key #{base_key} is blank in the configuration file"
            )
          end
        end
      end
    end

    BaseGem::CONFIGURATION_KEYS.each do |required_key|
      context "when the configuration hash does not contain the #{required_key} key" do
        it "raises an error if the #{required_key} is missing" do
          hash['configuration'].delete(required_key)

          expect { subject }.to raise_error(
            BaseGem::Exceptions::ConfigurationError,
            "The key #{required_key} is missing from the configuration file"\
            ', in Configuration section'
          )
        end
      end

      context "when the configuration hash #{required_key} key has blank value" do
        it "raises an error if the #{required_key} is missing" do
          hash['configuration'][required_key] = ''

          expect { subject }.to raise_error(
            BaseGem::Exceptions::ConfigurationError,
            "The key #{required_key} is blank in the configuration file"\
            ', in Configuration section'
          )
        end
      end
    end
  end
end
