require 'faraday'
require 'recereco/error/bad_gateway'
require 'recereco/error/bad_request'
require 'recereco/error/forbidden'
require 'recereco/error/gateway_timeout'
require 'recereco/error/internal_server_error'
require 'recereco/error/not_acceptable'
require 'recereco/error/not_found'
require 'recereco/error/service_unavailable'
require 'recereco/error/unauthorized'
module Recereco
  module Response
    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)
        binding.pry
        status_code = env[:status].to_i
        error_class = @klass.errors[status_code]
        raise error_class.from_response(env) if error_class
      end

      def initialize(app, klass)
        @klass = klass
        super(app)
      end

    end
  end
end
