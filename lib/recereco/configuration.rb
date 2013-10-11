require 'recereco/configuration'
require 'recereco/default'
require 'recereco/version'

module Recereco
  module Configuration

    extend Forwardable

    attr_accessor :consumer_key, :api_version, :user_agent
    attr_writer :consumer_secret
    def_delegator :options, :hash

    ENDPOINT = 'https://api.recereco.com'.freeze unless defined? Recereco::Configuration::ENDPOINT

    class << self

      def keys
        @keys ||= [
          :consumer_key,
          :consumer_secret,
          :api_version,
          :user_agent
        ]
      end

    end

    def configure
      yield self
      self
    end

    def reset!
      Recereco::Configuration.keys.each do |key|
        instance_variable_set(:"@#{key}", Recereco::Default.options[key])
      end
      self
    end

    # Prevent auth required access without {Recereco::Client}
    #
    # @return [Boolean]
    def credentials?
      false
    end

  private

    # @return [Hash]
    def options
      Hash[Recereco::Configuration.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

  end
end
