require 'net/http'
require 'stringio'
require 'uri'

module GeniusReferrals
  TransportResponse = Struct.new(:status_code, :headers, :body, keyword_init: true)

  class NetHTTPTransport
    # Send one HTTP request using Ruby stdlib Net::HTTP.
    def request(method, url, headers:, body:, timeout:)
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.open_timeout = timeout
      http.read_timeout = timeout

      request_class = Net::HTTP.const_get(method.capitalize)
      request = request_class.new(uri)
      headers.each { |key, value| request[key] = value }
      request.body = body if body

      response = http.request(request)
      TransportResponse.new(
        status_code: response.code.to_i,
        headers: response.each_header.to_h,
        body: response.body.to_s
      )
    end
  end
end
