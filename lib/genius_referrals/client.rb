require 'json'
require 'uri'

module GeniusReferrals
  DEFAULT_BASE_URL = 'https://api.geniusreferrals.com'
  RETRYABLE_STATUS_CODES = [408, 429, 500, 502, 503, 504].freeze

  class Client
    attr_reader :auth_token, :base_url, :timeout, :max_retries, :backoff_factor,
                :transport, :user_agent

    # Client for the Genius Referrals public API.
    #
    # @param auth_token [String] API token sent as `X-Auth-Token`.
    # @param base_url [String] API origin. Defaults to production.
    # @param timeout [Numeric] Request timeout in seconds.
    # @param max_retries [Integer] Retry budget for transient errors.
    # @param backoff_factor [Numeric] Initial exponential backoff delay.
    # @param transport [Object] Optional test/custom transport.
    def initialize(auth_token:, base_url: DEFAULT_BASE_URL, timeout: 30, max_retries: 2,
                   backoff_factor: 0.25, transport: nil,
                   user_agent: "geniusreferrals-ruby/#{VERSION}")
      raise ArgumentError, 'auth_token is required' if auth_token.to_s.empty?

      @auth_token = auth_token
      @base_url = base_url.to_s.sub(%r{/+\z}, '')
      @timeout = timeout
      @max_retries = max_retries
      @backoff_factor = backoff_factor
      @transport = transport || NetHTTPTransport.new
      @user_agent = user_agent

      @accounts = AccountsResource.new(self)
      @advocates = AdvocatesResource.new(self)
      @authentications = AuthenticationsResource.new(self)
      @bonuses = BonusesResource.new(self)
      @campaigns = CampaignsResource.new(self)
      @products = ProductsResource.new(self)
      @redemption_requests = RedemptionRequestsResource.new(self)
      @referrals = ReferralsResource.new(self)
      @reports = ReportsResource.new(self)
      @root = RootResource.new(self)
      @tags = TagsResource.new(self)
      @utilities = UtilitiesResource.new(self)
      @vouchers = VouchersResource.new(self)
      @widgets_packages = WidgetsPackagesResource.new(self)
    end

    attr_reader :accounts, :advocates, :authentications, :bonuses, :campaigns,
                :products, :redemption_requests, :referrals, :reports, :root,
                :tags, :utilities, :vouchers, :widgets_packages

    # Send a request to an API path and return parsed response content.
    def request(method, path, params: nil, json: nil)
      request = build_request(method, path, params: params, json: json)
      attempt = 0

      loop do
        begin
          response = transport.request(
            request[:method],
            request[:url],
            headers: request[:headers],
            body: request[:body],
            timeout: timeout
          )
        rescue StandardError => e
          raise TransportError, e.message if attempt >= max_retries

          sleep_for_retry(attempt)
          attempt += 1
          next
        end

        return parse_success(response.status_code, response.body) if response.status_code < 400

        if RETRYABLE_STATUS_CODES.include?(response.status_code) && attempt < max_retries
          sleep_for_retry(attempt)
          attempt += 1
          next
        end

        parsed = parse_json(response.body)
        error_class = ERROR_BY_STATUS.fetch(response.status_code, APIError)
        raise error_class.new(
          error_message(response.status_code, parsed, response.body),
          status_code: response.status_code,
          response: parsed,
          body: response.body,
          request: request
        )
      end
    end

    # Build an authenticated JSON request hash.
    def build_request(method, path, params: nil, json: nil)
      clean_path = path.start_with?('/') ? path : "/#{path}"
      url = "#{base_url}#{clean_path}#{query_string(params || {})}"
      body = json.nil? ? nil : JSON.generate(json)
      headers = {
        'Accept' => 'application/json',
        'User-Agent' => user_agent,
        'X-Auth-Token' => auth_token
      }
      headers['Content-Type'] = 'application/json' unless json.nil?

      { method: method.to_s.upcase, url: url, headers: headers, body: body }
    end

    private

    def query_string(params)
      pairs = []
      params.each do |key, value|
        next if value.nil?

        if value.is_a?(Array)
          value.each { |item| pairs << [key, item] }
        else
          pairs << [key, value]
        end
      end
      pairs.empty? ? '' : "?#{URI.encode_www_form(pairs)}"
    end

    def parse_success(status_code, body)
      return nil if status_code == 204 || body.to_s.empty?

      parse_json(body)
    end

    def parse_json(body)
      return nil if body.to_s.empty?

      JSON.parse(body)
    rescue JSON::ParserError
      body
    end

    def error_message(status_code, parsed, body)
      if parsed.is_a?(Hash)
        message = parsed['message'] || parsed['error']
        return "Genius Referrals API error #{status_code}: #{message}" if message
      end
      return "Genius Referrals API error #{status_code}" unless body.to_s.empty?

      "Genius Referrals API error #{status_code}: empty response"
    end

    def sleep_for_retry(attempt)
      delay = backoff_factor * (2**attempt)
      sleep(delay) if delay.positive?
    end
  end

  # Backward-compatible class name for callers of the older generated gem.
  class GeniusReferralsClient < Client
    def initialize(content_type = 'application/json', x_auth_token = nil, **options)
      if content_type.is_a?(Hash)
        options = content_type.merge(options)
      end

      x_auth_token = options.delete(:x_auth_token) || options.delete('x_auth_token') || x_auth_token
      token = options.delete(:auth_token) || x_auth_token
      super(auth_token: token, **options)
    end
  end
end
