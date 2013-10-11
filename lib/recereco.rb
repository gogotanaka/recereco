require 'recereco/account'
require 'recereco/client'
require 'recereco/configuration'
require 'recereco/default'

module Recereco
  class << self
    include Recereco::Configuration

    # Delegate to a Recereco::Client
    #
    # @return [Recereco::Client]
    def client
      @client = Recereco::Client.new(options) unless defined?(@client) && @client.hash == options.hash
      @client
    end

    def respond_to?(method, include_private=false)
      client.respond_to?(method, include_private)
    end

  private

    def method_missing(method, *args, &block)
      return super unless client.respond_to?(method)
      client.send(method, *args, &block)
    end

  end
end

Recereco.reset!
