module GeniusReferrals
  class ReportsResource < Resource
    # Run the 1099 tax report.
    def tax_1099(client_slug: nil, account_slug: nil, year: nil)
      request('GET',
              '/reports/1099-tax-report',
              params: compact(client_slug: client_slug, account_slug: account_slug, year: year))
    end

    # Run the revenue report with accepted live-doc and SDK parameter names.
    def revenue(account_slug: nil, client_account_slug: nil, start_date: nil, end_date: nil)
      request('GET',
              '/reports/revenue',
              params: compact(account_slug: account_slug,
                              client_account_slug: client_account_slug,
                              start_date: start_date,
                              end_date: end_date))
    end

    # Run the daily bonuses given report.
    def bonuses_daily_given(account_slug:, start_date:, end_date:, advocate_token: nil)
      dated('/reports/bonuses-daily-given', account_slug, start_date, end_date, advocate_token)
    end

    # Run the bonuses summary per origin report.
    def bonuses_summary_per_origin(account_slug:, start_date:, end_date:, advocate_token: nil)
      dated('/reports/bonuses-summary-per-origin', account_slug, start_date, end_date, advocate_token)
    end

    # Run the click daily participation report.
    def click_daily_participation(account_slug:, start_date:, end_date:, advocate_token: nil)
      dated('/reports/click-daily-participation', account_slug, start_date, end_date, advocate_token)
    end

    # Run the referral daily participation report.
    def referral_daily_participation(account_slug:, start_date:, end_date:, advocate_token: nil)
      dated('/reports/referral-daily-participation', account_slug, start_date, end_date, advocate_token)
    end

    # Run the referrals summary per origin report.
    def referrals_summary_per_origin(account_slug:, start_date:, end_date:, advocate_token: nil)
      dated('/reports/referrals-summary-per-origin', account_slug, start_date, end_date, advocate_token)
    end

    # Run the share daily participation report.
    def share_daily_participation(account_slug:, start_date:, end_date:, advocate_token: nil)
      dated('/reports/share-daily-participation', account_slug, start_date, end_date, advocate_token)
    end

    # Run the top advocates report.
    def top_advocates(account_slug:, start_date:, end_date:, advocate_token: nil, limit: nil)
      request('GET',
              '/reports/top-advocates',
              params: compact(account_slug: account_slug,
                              start_date: start_date,
                              end_date: end_date,
                              advocate_token: advocate_token,
                              limit: limit))
    end

    private

    def dated(path, account_slug, start_date, end_date, advocate_token)
      request('GET',
              path,
              params: compact(account_slug: account_slug,
                              start_date: start_date,
                              end_date: end_date,
                              advocate_token: advocate_token))
    end
  end
end
