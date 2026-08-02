module GeniusReferrals
  class RedemptionRequestsResource < Resource
    # List redemption requests for an account.
    def list(account_slug, page: 1, limit: 10, filter: nil, sort: nil)
      page('GET',
           "/accounts/#{esc(account_slug)}/redemption-requests",
           params: compact(page: page, limit: limit, filter: filter, sort: sort))
    end

    # Create a redemption request.
    def create(account_slug, redemption_request)
      request('POST',
              "/accounts/#{esc(account_slug)}/redemption-requests",
              json: wrapped('redemption_request', redemption_request))
    end

    # Retrieve one redemption request.
    def retrieve(account_slug, redemption_request_id)
      request('GET', "/accounts/#{esc(account_slug)}/redemption-requests/#{esc(redemption_request_id)}")
    end

    # Patch a redemption request with unwrapped partial fields.
    def patch(account_slug, redemption_request_id, **fields)
      request('PATCH',
              "/accounts/#{esc(account_slug)}/redemption-requests/#{esc(redemption_request_id)}",
              json: fields)
    end

    # Patch the redemption action endpoint.
    def redeem(account_slug, redemption_request_id, **fields)
      request('PATCH',
              "/accounts/#{esc(account_slug)}/redemption-requests/#{esc(redemption_request_id)}/redemption",
              json: fields)
    end
  end
end
