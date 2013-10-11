require 'recereco/api/utils'
require 'recereco/currency'

module Recereco
  module API
    module Currencies
      include Recereco::API::Utils

      # Returns the list of default currencies
      #
      # @see https://dev.recereco.net/home/api#currency_get
      # @note Authentication Not Required
      # @return [Array] Array of {Recereco::Currency}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of default currencies
      #   Recereco.currency_get
      def currency_get(options={})
        objects_from_response(Recereco::Currency, :get, '/currency', :currencies, options)
      end
      alias currencies currency_get

    end
  end
end
