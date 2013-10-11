require 'recereco/error/server_error'

module Recereco
  class Error
    # Raised when Zaim returns the HTTP status code 500
    class InternalServerError < Recereco::Error::ServerError
      HTTP_STATUS_CODE = 500
      MESSAGE = 'Something is technically wrong.'
    end
  end
end
