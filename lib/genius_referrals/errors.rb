module GeniusReferrals
  SENSITIVE_HEADER_NAMES = ['authorization', 'x-auth-token'].freeze

  # Returns a redacted deep copy for objects that may contain credentials.
  def self.redact(value)
    case value
    when Hash
      value.each_with_object({}) do |(key, item), redacted|
        lowered = key.to_s.downcase
        redacted[key] = if SENSITIVE_HEADER_NAMES.include?(lowered) || lowered.include?('token')
                          '[REDACTED]'
                        else
                          redact(item)
                        end
      end
    when Array
      value.map { |item| redact(item) }
    else
      value
    end
  end

  class Error < StandardError
  end

  class TransportError < Error
  end

  class APIError < Error
    attr_reader :status_code, :response, :body, :request

    def initialize(message, status_code:, response: nil, body: nil, request: nil)
      super(message)
      @status_code = status_code
      @response = response
      @body = body
      @request = GeniusReferrals.redact(request || {})
    end
  end

  class AuthenticationError < APIError
  end

  class AuthorizationError < APIError
  end

  class NotFoundError < APIError
  end

  class ConflictError < APIError
  end

  class ValidationError < APIError
  end

  class RateLimitError < APIError
  end

  ERROR_BY_STATUS = {
    400 => ValidationError,
    401 => AuthenticationError,
    403 => AuthorizationError,
    404 => NotFoundError,
    409 => ConflictError,
    422 => ValidationError,
    429 => RateLimitError
  }.freeze
end
