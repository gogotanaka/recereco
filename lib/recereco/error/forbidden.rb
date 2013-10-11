require 'recereco/error/client_error'

module Recereco
  class Error
    # Raised when Zaim returns the HTTP status code 403
    class Forbidden < Recereco::Error::ClientError
      HTTP_STATUS_CODE = 403
    end
  end
end
