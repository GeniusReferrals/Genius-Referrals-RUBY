module GeniusReferrals
  class ReferralsResource < Resource
    # List referrals for one advocate.
    def list(account_slug, advocate_token, page: 1, limit: 10, filter: nil, sort: nil)
      page('GET',
           "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}/referrals",
           params: compact(page: page, limit: limit, filter: filter, sort: sort))
    end

    # Create a referral.
    def create(account_slug, advocate_token, referral)
      request('POST',
              "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}/referrals",
              json: wrapped('referral', referral))
    end

    # Retrieve one referral.
    def retrieve(account_slug, advocate_token, referral_id)
      request('GET', "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}/referrals/#{esc(referral_id)}")
    end

    # Replace one referral.
    def update(account_slug, advocate_token, referral_id, referral)
      request('PUT',
              "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}/referrals/#{esc(referral_id)}",
              json: wrapped('referral', referral))
    end

    # Delete one referral.
    def delete(account_slug, advocate_token, referral_id)
      request('DELETE', "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}/referrals/#{esc(referral_id)}")
    end
  end
end
