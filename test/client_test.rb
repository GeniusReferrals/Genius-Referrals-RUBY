require_relative 'test_helper'

class ClientTest < Minitest::Test
  def test_sends_x_auth_token_header_and_json_body
    transport = FakeTransport.new([response(200, '{"code":200,"data":{"ok":true}}')])
    client = GeniusReferrals::Client.new(
      auth_token: 'secret-token',
      transport: transport,
      base_url: 'https://api.example.test'
    )

    result = client.authentications.test

    assert_equal({ 'ok' => true }, result.data)
    request = transport.requests.first
    assert_equal('GET', request[:method])
    assert_equal('secret-token', request[:headers]['X-Auth-Token'])
    assert_equal('https://api.example.test/test-authentication', request[:url])
  end

  def test_redacts_token_from_api_error_request_snapshot
    transport = FakeTransport.new([response(401, '{"code":401,"message":"bad token"}')])
    client = GeniusReferrals::Client.new(auth_token: 'secret-token', transport: transport)

    error = assert_raises(GeniusReferrals::AuthenticationError) do
      client.authentications.test
    end

    assert_equal('[REDACTED]', error.request[:headers]['X-Auth-Token'])
    refute_includes(error.message, 'secret-token')
  end

  def test_retries_transient_status_before_success
    transport = FakeTransport.new([
      response(500, '{"message":"temporary"}'),
      response(200, '{"code":200,"data":{"ok":true}}')
    ])
    client = GeniusReferrals::Client.new(
      auth_token: 'token',
      transport: transport,
      max_retries: 1,
      backoff_factor: 0
    )

    result = client.authentications.test

    assert_equal(true, result.data['ok'])
    assert_equal(2, transport.requests.length)
  end

  def test_raises_after_retry_budget
    transport = FakeTransport.new([
      response(429, '{"message":"slow down"}'),
      response(429, '{"message":"still slow"}')
    ])
    client = GeniusReferrals::Client.new(
      auth_token: 'token',
      transport: transport,
      max_retries: 1,
      backoff_factor: 0
    )

    assert_raises(GeniusReferrals::RateLimitError) do
      client.authentications.test
    end
  end

  def test_backoff_uses_exponential_delay
    transport = FakeTransport.new([
      response(503, '{"message":"temporary"}'),
      response(503, '{"message":"temporary"}'),
      response(200, '{"code":200,"data":{}}')
    ])
    client = GeniusReferrals::Client.new(
      auth_token: 'token',
      transport: transport,
      max_retries: 2,
      backoff_factor: 0.5
    )
    sleeps = []
    client.define_singleton_method(:sleep) { |delay| sleeps << delay }

    client.authentications.test

    assert_equal([0.5, 1.0], sleeps)
  end

  def test_legacy_client_class_accepts_old_token_keyword
    transport = FakeTransport.new([response(200, '{"code":200,"data":{"ok":true}}')])
    client = GeniusReferrals::GeniusReferralsClient.new(
      x_auth_token: 'token',
      transport: transport,
      base_url: 'https://api.example.test'
    )

    client.authentications.test

    assert_equal('token', transport.requests.first[:headers]['X-Auth-Token'])
  end
end
