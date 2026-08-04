module GeniusReferrals
  class UtilitiesResource < Resource
    # List bonus redemption methods.
    def bonus_redemption_methods(page: 1, limit: 10)
      page('GET', '/utilities/bonuses-redemption-methods', params: { page: page, limit: limit })
    end

    # Retrieve one bonus redemption method.
    def bonus_redemption_method(slug)
      request('GET', "/utilities/bonuses-redemption-methods/#{esc(slug)}")
    end

    # List currencies.
    def currencies(page: 1, limit: 10)
      page('GET', '/utilities/currencies', params: { page: page, limit: limit })
    end

    # Retrieve one currency.
    def currency(code)
      request('GET', "/utilities/currencies/#{esc(code)}")
    end

    # List utility payment methods.
    def payment_methods(page: 1, limit: 10)
      page('GET', '/utilities/payment-methods', params: { page: page, limit: limit })
    end

    # List redemption request actions.
    def redemption_request_actions(page: 1, limit: 10)
      page('GET', '/utilities/redemption-request-actions', params: { page: page, limit: limit })
    end

    # Retrieve one redemption request action.
    def redemption_request_action(slug)
      request('GET', "/utilities/redemption-request-actions/#{esc(slug)}")
    end

    # List redemption request statuses.
    def redemption_request_statuses(page: 1, limit: 10)
      page('GET', '/utilities/redemption-request-statuses', params: { page: page, limit: limit })
    end

    # Retrieve one redemption request status.
    def redemption_request_status(slug)
      request('GET', "/utilities/redemption-request-statuses/#{esc(slug)}")
    end

    # List referral origins.
    def referral_origins(page: 1, limit: 10)
      page('GET', '/utilities/referral-origins', params: { page: page, limit: limit })
    end

    # Retrieve one referral origin.
    def referral_origin(slug)
      request('GET', "/utilities/referral-origins/#{esc(slug)}")
    end
  end
end
