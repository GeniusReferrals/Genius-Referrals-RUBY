module GeniusReferrals
  class CampaignsResource < Resource
    # List campaigns for an account.
    def list(account_slug, page: 1, limit: 10, filter: nil, sort: nil)
      page('GET',
           "/accounts/#{esc(account_slug)}/campaigns",
           params: compact(page: page, limit: limit, filter: filter, sort: sort))
    end

    # Retrieve one campaign.
    def retrieve(account_slug, campaign_slug)
      request('GET', "/accounts/#{esc(account_slug)}/campaigns/#{esc(campaign_slug)}")
    end
  end
end
