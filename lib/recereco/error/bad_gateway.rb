require 'recereco/error/server_error'

module Recereco
  class Error
    # Raised when Zaim returns the HTTP status code 502
    class BadGateway < Recereco::Error::ServerError
      HTTP_STATUS_CODE = 502
      MESSAGE = 'Recereco is down or being upgraded.'
    end
  end
end
