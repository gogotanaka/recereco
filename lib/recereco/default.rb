require 'recereco/configuration'
require 'recereco/version'

module Recereco
  module Default

    API_VERSION = 2 unless defined? Recereco::Default::API_VERSION
    USER_AGENT = "Recereco Ruby Gem #{Recereco::Version}".freeze unless defined? Recereco::Default::USER_AGENT

    class << self

      # @return [Hash]
      def options
        Hash[Recereco::Configuration.keys.map{|key| [key, send(key)]}]
      end

      # @return [String]
      def consumer_key
        ENV['RECERECO_CONSUMER_KEY']
      end

      # @return [String]
      def consumer_secret
        ENV['RECERECO_CONSUMER_SECRET']
      end

      # @return [Integer]
      def api_version
        API_VERSION
      end

      # @return [String]
      def user_agent
        USER_AGENT
      end

    end
  end
end