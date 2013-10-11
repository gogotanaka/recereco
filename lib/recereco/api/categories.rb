require 'recereco/api/utils'
require 'recereco/category'

module Recereco
  module API
    module Categories
      include Recereco::API::Utils

      # Returns the list of custom categories if authentication was successful, otherwise raises {Recereco::Error::Unauthorized}
      #
      # @see https://dev.recereco.net/home/api#category_home_get
      # @note Authentication Required
      # @raise [Recereco::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      # @return [Array] Array of {Recereco::Category}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of custom categories if authentication was successful
      #   client.category_home_get
      def category_home_get(options={})
        objects_from_response(Recereco::Category, :get, '/home/category', :categories, options)
      end
      alias categories category_home_get

      # Returns the list of default categories
      #
      # @see https://dev.recereco.net/home/api#category_get
      # @note Authentication Not Required
      # @return [Array] Array of {Recereco::Category}
      # @param options [Hash] A customizable set of options.
      # @example Return the list of default categories
      #   Recereco.category_get
      def category_get(options={})
        objects_from_response(Recereco::Category, :get, '/category', :categories, options)
      end
      alias default_categories category_get

    end
  end
end
