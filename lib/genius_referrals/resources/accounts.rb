module GeniusReferrals
  class AccountsResource < Resource
    # List accounts with standard page/limit pagination.
    def list(page: 1, limit: 10, filter: nil, sort: nil)
      page('GET', '/accounts', params: compact(page: page, limit: limit, filter: filter, sort: sort))
    end

    # Retrieve one account by slug.
    def retrieve(account_slug)
      request('GET', "/accounts/#{esc(account_slug)}")
    end
  end
end
