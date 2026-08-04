$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'json'
require 'minitest/autorun'
require 'genius_referrals'

class FakeTransport
  attr_reader :requests

  def initialize(responses)
    @responses = responses.dup
    @requests = []
  end

  def request(method, url, headers:, body:, timeout:)
    @requests << {
      method: method,
      url: url,
      headers: headers,
      body: body,
      timeout: timeout
    }
    response = @responses.shift
    raise response if response.is_a?(StandardError)

    response
  end
end

def response(status_code, body = '')
  GeniusReferrals::TransportResponse.new(status_code: status_code, headers: {}, body: body)
end
