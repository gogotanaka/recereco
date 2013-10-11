require 'recereco/api/accounts'
require 'recereco/api/categories'
require 'recereco/api/currencies'
require 'recereco/api/genres'
require 'recereco/configuration'
require 'recereco/request'

module Recereco
  class Client
    include Recereco::API::Accounts
    include Recereco::API::Categories
    include Recereco::API::Currencies
    include Recereco::API::Genres
    include Recereco::API::Money
    include Recereco::API::Users
    include Recereco::Configuration
    include Recereco::Request

    attr_accessor :oauth_token
    attr_writer :oauth_token_secret

    # Initializes a new Client object
    # 
    # @param options [Hash] A customizable set of options.
    # @option oauth_token [String]
    # @option oauth_token_secret [String]
    # @return [Recereco::Client]
    def initialize(options={})
      # Set global keys
      Recereco::Configuration.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Recereco.instance_variable_get(:"@#{key}"))
      end
      # Set client keys
      oauth_token_keys.each do |key|
        instance_variable_set(:"@#{key}", options[key])
      end
      self
    end

    # @return [Boolean]
    def oauth_token?
      !!(@oauth_token && @oauth_token_secret)
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end

  private

    def oauth_token_keys
      @oauth_token_keys ||= [
        :oauth_token,
        :oauth_token_secret
      ]
    end

    # @return [Hash]
    def credentials
      {
        consumer_key: @consumer_key,
        consumer_secret: @consumer_secret,
        token: @oauth_token,
        token_secret: @oauth_token_secret        
      }
    end

  end
end
