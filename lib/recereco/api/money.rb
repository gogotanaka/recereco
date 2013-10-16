require 'recereco/api/utils'
require 'recereco/money'

module Recereco
  module API
    module Money
      include Recereco::API::Utils

      # Returns the list of input data if authentication was successful, otherwise raises {Zaim::Error::Unauthorized}
      #
      # @see https://dev.zaim.net/home/api#money_get
      # @note Authentication Required
      # @raise [Zaim::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array] Array of {Zaim::Money}.
      # @param options [Hash] A customizable set of options.
      # @example Return the list of input money data if authentication was successful.
      #   client.money_get
      def money_get(options={from: "20130101_00010", page: 0})
        from = options[:from]
        page = options[:page]
        get("/api/1/latestreceipt?from=#{from}&page=#{page}")[:body]
      end
      alias money money_get

    end
  end
end
