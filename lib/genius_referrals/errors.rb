module GeniusReferrals
  SENSITIVE_HEADER_NAMES = ['authorization', 'x-auth-token'].freeze
  SENSITIVE_FIELD_FRAGMENTS = ['api_key', 'apikey', 'authorization', 'password', 'secret', 'token'].freeze

  # Returns a redacted deep copy for objects that may contain credentials.
  def self.redact(value, secrets: [])
    secret_values = Array(secrets).compact.map(&:to_s).reject(&:empty?)
    case value
    when Hash
      value.each_with_object({}) do |(key, item), redacted|
        lowered = key.to_s.downcase
        redacted[key] = if sensitive_key?(lowered)
                          '[REDACTED]'
                        else
                          redact(item, secrets: secret_values)
                        end
      end
    when Array
      value.map { |item| redact(item, secrets: secret_values) }
    when String
      redact_string(value, secret_values)
    else
      value
    end
  end

  def self.sensitive_key?(key)
    SENSITIVE_HEADER_NAMES.include?(key) ||
      SENSITIVE_FIELD_FRAGMENTS.any? { |fragment| key.include?(fragment) }
  end

  def self.redact_string(value, secrets)
    secrets.reduce(value.dup) do |text, secret|
      text.gsub(secret, '[REDACTED]')
    end
  end

  class Error < StandardError
  end

  class TransportError < Error
  end

  class APIError < Error
    attr_reader :status_code, :response, :body, :request

    def initialize(message, status_code:, response: nil, body: nil, request: nil, secrets: [])
      redacted_message = GeniusReferrals.redact(message, secrets: secrets)
      super(redacted_message)
      @status_code = status_code
      @response = GeniusReferrals.redact(response, secrets: secrets)
      @body = GeniusReferrals.redact(body, secrets: secrets)
      @request = GeniusReferrals.redact(request || {}, secrets: secrets)
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
