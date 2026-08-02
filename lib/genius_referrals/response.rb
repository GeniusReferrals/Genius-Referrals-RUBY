module GeniusReferrals
  APIResponse = Struct.new(:code, :data, :raw, keyword_init: true) do
    # Build a response envelope from the public API `{code, data}` shape.
    def self.from_api(payload)
      if payload.is_a?(Hash) && payload.key?('code') && payload.key?('data')
        new(code: payload['code'], data: payload['data'], raw: payload)
      else
        new(code: nil, data: payload, raw: payload)
      end
    end
  end

  Page = Struct.new(:results, :page, :limit, :total, :raw, keyword_init: true) do
    # Build a pagination wrapper from the standard list response shape.
    def self.from_api(payload)
      envelope = APIResponse.from_api(payload)
      data = envelope.data

      if data.is_a?(Hash)
        new(
          results: data['results'] || [],
          page: data['page'],
          limit: data['limit'],
          total: data['total'],
          raw: payload
        )
      elsif data.is_a?(Array)
        new(results: data, page: nil, limit: nil, total: nil, raw: payload)
      else
        new(results: [], page: nil, limit: nil, total: nil, raw: payload)
      end
    end
  end
end
