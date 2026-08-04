module GeniusReferrals
  class BonusesResource < Resource
    # List bonuses for an account.
    def list(account_slug, page: 1, limit: 10, filter: nil, sort: nil, **filters)
      params = compact({ page: page, limit: limit, filter: filter, sort: sort }.merge(filters))
      page('GET', "/accounts/#{esc(account_slug)}/bonuses", params: params)
    end

    # Create a bonus using the `bonus` wrapper.
    def create(account_slug, bonus)
      request('POST', "/accounts/#{esc(account_slug)}/bonuses", json: wrapped('bonus', bonus))
    end

    # Create a forced bonus using the `bonus` wrapper.
    def force(account_slug, bonus)
      request('POST', "/accounts/#{esc(account_slug)}/bonuses/force", json: wrapped('bonus', bonus))
    end

    # Simulate bonus eligibility with API query parameters.
    def checkup(account_slug, **params)
      request('GET', "/accounts/#{esc(account_slug)}/bonuses/checkup", params: params)
    end

    # List bonus request traces.
    def traces(account_slug, page: 1, limit: 10, **params)
      page('GET',
           "/accounts/#{esc(account_slug)}/bonuses/traces",
           params: compact({ page: page, limit: limit }.merge(params)))
    end

    # Retrieve one bonus request trace.
    def retrieve_trace(account_slug, trace_id)
      request('GET', "/accounts/#{esc(account_slug)}/bonuses/traces/#{esc(trace_id)}")
    end

    # Retrieve one bonus.
    def retrieve(account_slug, bonus_id)
      request('GET', "/accounts/#{esc(account_slug)}/bonuses/#{esc(bonus_id)}")
    end

    # Patch a bonus with unwrapped partial fields.
    def patch(account_slug, bonus_id, **fields)
      request('PATCH', "/accounts/#{esc(account_slug)}/bonuses/#{esc(bonus_id)}", json: fields)
    end

    # Delete one bonus.
    def delete(account_slug, bonus_id)
      request('DELETE', "/accounts/#{esc(account_slug)}/bonuses/#{esc(bonus_id)}")
    end

    # Attach a tag to a bonus using the live-doc `bonus.tag.slug` shape.
    def add_tag(account_slug, bonus_id, tag_slug)
      request('POST',
              "/accounts/#{esc(account_slug)}/bonuses/#{esc(bonus_id)}/tags",
              json: { 'bonus' => { 'tag' => { 'slug' => tag_slug } } })
    end

    # Remove one tag from a bonus.
    def remove_tag(account_slug, bonus_id, tag_slug)
      request('DELETE', "/accounts/#{esc(account_slug)}/bonuses/#{esc(bonus_id)}/tags/#{esc(tag_slug)}")
    end
  end
end
