require 'recereco/error/client_error'

module Recereco
  class Error
    # Raised when Zaim returns the HTTP status code 400
    class BadRequest < Recereco::Error::ClientError
      HTTP_STATUS_CODE = 400
    end
  end
end
