#require 'faraday'
#require 'faraday_middleware'
require 'recereco/configuration'
#require 'recereco/response'
#equire 'recereco/error/client_error'
#require 'recereco/error/decode_error'

module Recereco
  module Request

    def get(path, params={})
      request(:get, path, params)
    end

    def post(path, params={})
      request(:post, path, params)
    end

    def put(path, params={})
      request(:put, path, params)
    end

    def delete(path, params={})
      request(:delete, path, params)
    end

  private

    # Returns a Faraday::Connection object
    #
    # @return [Faraday::Connection]
    def connection
      return @connection if @connection

      @connection = Faraday.new(Recereco::Configuration::ENDPOINT) do |conn|
        conn.request :oauth, credentials if respond_to?(:credentials?) && credentials?
        conn.request :url_encoded
        conn.request :json
        conn.use Recereco::Response::RaiseError, Recereco::Error::ClientError
        conn.response :json, :content_type => /\bjson$/
        conn.use Recereco::Response::RaiseError, Recereco::Error::ServerError
        conn.adapter Faraday.default_adapter
      end
    end

    def request(method, path, params={})
      connection.send(method.to_sym, path, params).env
    rescue Faraday::Error::ClientError then raise Recereco::Error::ClientError
    end

  end
end
