require 'recereco/identity'

module Recereco
  class Account < Recereco::Identity
    attr_reader :name, :sort, :mode, :parent_account_id, :active

    # Time when the Money object was last modified on Recereco
    #
    # @return [Time]
    def modified
      @modified ||= Time.parse(@attrs[:modified]) rescue nil
    end

  end
end