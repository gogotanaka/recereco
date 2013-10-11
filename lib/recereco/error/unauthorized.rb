require 'recereco/error/client_error'

module Recereco
  class Error
    # Raised when Zaim returns the HTTP status code 401
    class Unauthorized < Recereco::Error::ClientError
      HTTP_STATUS_CODE = 401
    end
  end
end
