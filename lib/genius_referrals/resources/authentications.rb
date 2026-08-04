module GeniusReferrals
  class AuthenticationsResource < Resource
    # Call `/test-authentication` with the configured token.
    def test
      request('GET', '/test-authentication')
    end
  end
end
