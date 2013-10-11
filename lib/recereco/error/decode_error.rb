require 'recereco/error'

module Recereco
  class Error
    # Raised when JSON parsing fails
    class DecodeError < Recereco::Error
    end
  end
end