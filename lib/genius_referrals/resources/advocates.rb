module GeniusReferrals
  class AdvocatesResource < Resource
    # List advocates for an account.
    def list(account_slug, page: 1, limit: 10, filter: nil, sort: nil, **filters)
      params = compact({ page: page, limit: limit, filter: filter, sort: sort }.merge(filters))
      page('GET', "/accounts/#{esc(account_slug)}/advocates", params: params)
    end

    # Iterate advocates across all available pages.
    def each(account_slug, page_number: 1, limit: 100, **filters, &block)
      each_page("/accounts/#{esc(account_slug)}/advocates",
                page_number: page_number,
                limit: limit,
                params: filters,
                &block)
    end

    # Create an advocate using the accepted `advocate` wrapper.
    def create(account_slug, advocate)
      request('POST', "/accounts/#{esc(account_slug)}/advocates", json: wrapped('advocate', advocate))
    end

    # Retrieve one advocate by token.
    def retrieve(account_slug, advocate_token)
      request('GET', "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}")
    end

    # Replace an advocate using the accepted `advocate` wrapper.
    def update(account_slug, advocate_token, advocate)
      request('PUT',
              "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}",
              json: wrapped('advocate', advocate))
    end

    # Patch an advocate with unwrapped partial fields.
    def patch(account_slug, advocate_token, **fields)
      request('PATCH', "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}", json: fields)
    end

    # Delete one advocate.
    def delete(account_slug, advocate_token)
      request('DELETE', "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}")
    end

    # Delete all advocates for an account, or a scoped comma-separated token set.
    def delete_all(account_slug, advocates: nil)
      query_value = advocates.is_a?(Array) ? advocates.join(',') : advocates
      request('DELETE',
              "/accounts/#{esc(account_slug)}/advocates",
              params: compact(advocates: query_value))
    end

    # Return share links for one advocate.
    def share_links(account_slug, advocate_token)
      request('GET', "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}/share-links")
    end

    # List payment methods for one advocate.
    def payment_methods(account_slug, advocate_token, page: 1, limit: 10)
      page('GET',
           "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}/payment-methods",
           params: { page: page, limit: limit })
    end

    # Create an advocate payment method.
    def create_payment_method(account_slug, advocate_token, payment_method)
      request('POST',
              "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}/payment-methods",
              json: wrapped('advocate_payment_method', payment_method))
    end

    # Retrieve one advocate payment method.
    def retrieve_payment_method(account_slug, advocate_token, payment_method_id)
      request('GET',
              "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}/payment-methods/#{esc(payment_method_id)}")
    end

    # Replace one advocate payment method.
    def update_payment_method(account_slug, advocate_token, payment_method_id, payment_method)
      request('PUT',
              "/accounts/#{esc(account_slug)}/advocates/#{esc(advocate_token)}/payment-methods/#{esc(payment_method_id)}",
              json: wrapped('advocate_payment_method', payment_method))
    end
  end
end
