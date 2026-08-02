module GeniusReferrals
  class TagsResource < Resource
    # List tags.
    def list(account_slug, page: 1, limit: 10, filter: nil, sort: nil)
      page('GET',
           "/accounts/#{esc(account_slug)}/tags",
           params: compact(page: page, limit: limit, filter: filter, sort: sort))
    end

    # Create a tag.
    def create(account_slug, tag)
      request('POST', "/accounts/#{esc(account_slug)}/tags", json: wrapped('tag', tag))
    end

    # Retrieve one tag.
    def retrieve(account_slug, tag_slug)
      request('GET', "/accounts/#{esc(account_slug)}/tags/#{esc(tag_slug)}")
    end

    # Replace one tag.
    def update(account_slug, tag_slug, tag)
      request('PUT', "/accounts/#{esc(account_slug)}/tags/#{esc(tag_slug)}", json: wrapped('tag', tag))
    end

    # Patch a tag with unwrapped partial fields.
    def patch(account_slug, tag_slug, **fields)
      request('PATCH', "/accounts/#{esc(account_slug)}/tags/#{esc(tag_slug)}", json: fields)
    end

    # Delete one tag.
    def delete(account_slug, tag_slug)
      request('DELETE', "/accounts/#{esc(account_slug)}/tags/#{esc(tag_slug)}")
    end
  end
end
