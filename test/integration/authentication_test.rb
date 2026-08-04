require_relative '../test_helper'

class AuthenticationIntegrationTest < Minitest::Test
  def test_live_authentication_when_enabled
    skip 'Set GR_SDK_RUN_INTEGRATION=1 and GR_API_TOKEN to run live authentication smoke test' unless ENV['GR_SDK_RUN_INTEGRATION'] == '1'

    client = GeniusReferrals::Client.new(auth_token: ENV.fetch('GR_API_TOKEN'))
    result = client.authentications.test

    assert_kind_of(Hash, result.raw)
    assert(result.raw.key?('code'))
  end
end
