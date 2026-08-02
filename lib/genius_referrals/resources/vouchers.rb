module GeniusReferrals
  class VouchersResource < Resource
    # List vouchers.
    def list(account_slug, page: 1, limit: 10)
      page('GET', "/accounts/#{esc(account_slug)}/vouchers", params: { page: page, limit: limit })
    end

    # Create a voucher.
    def create(account_slug, voucher)
      request('POST', "/accounts/#{esc(account_slug)}/vouchers", json: wrapped('voucher', voucher))
    end

    # List voucher denominations for a currency.
    def denominations(account_slug, currency_code)
      request('GET', "/accounts/#{esc(account_slug)}/vouchers-denominations/#{esc(currency_code)}")
    end

    # Retrieve one voucher.
    def retrieve(account_slug, voucher_id)
      request('GET', "/accounts/#{esc(account_slug)}/vouchers/#{esc(voucher_id)}")
    end

    # Patch a voucher with unwrapped partial fields.
    def patch(account_slug, voucher_id, **fields)
      request('PATCH', "/accounts/#{esc(account_slug)}/vouchers/#{esc(voucher_id)}", json: fields)
    end

    # Delete one voucher.
    def delete(account_slug, voucher_id)
      request('DELETE', "/accounts/#{esc(account_slug)}/vouchers/#{esc(voucher_id)}")
    end
  end
end
