require 'recereco/error/server_error'

module Recereco
  class Error
    # Raised when Zaim returns the HTTP status code 503
    class ServiceUnavailable < Recereco::Error::ServerError
      HTTP_STATUS_CODE = 503
      MESSAGE = 'Zaim is over capacity.'
    end
  end
end
