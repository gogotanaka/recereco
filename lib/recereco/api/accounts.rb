require 'recereco/api/utils'
require 'recereco/account'

module Recereco
  module API
    module Accounts
      include Recereco::API::Utils

      # Returns the list of custom accounts if authentication was successful, otherwise raises {Recereco::Error::Unauthorized}
      #
      # @see https://dev.recereco.net/home/api#account_home_get
      # @note Authentication Required
      # @raise [Recereco::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array] Array of {Recereco::Account}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of custom accounts if authentication was successful
      #   client.account_home_get
      def account_home_get(options={})
        objects_from_response(Recereco::Account, :get, '/home/account', :accounts, options)
      end
      alias accounts account_home_get

      # Returns the list of default accounts
      #
      # @see https://dev.ecereco.net/home/api#account_get
      # @note Authentication Not Required
      # @return [Array] Array of {Recereco::Account}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of default accounts
      #   Recereco.account_get
      def account_get(options={})
        objects_from_response(Recereco::Account, :get, '/account', :accounts, options)
      end
      alias default_accounts account_get

    end
  end
end
