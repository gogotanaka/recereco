require 'recereco/error/client_error'

module Recereco
  class Error
    # Raised when Zaim returns the HTTP status code 404
    class NotFound < Recereco::Error::ClientError
      HTTP_STATUS_CODE = 404
    end
  end
end
