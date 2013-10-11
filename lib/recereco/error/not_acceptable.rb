require 'recereco/error/client_error'

module Recereco
  class Error
    # Raised when Zaim returns the HTTP status code 406
    class NotAcceptable < Recereco::Error::ClientError
      HTTP_STATUS_CODE = 406
    end
  end
end
