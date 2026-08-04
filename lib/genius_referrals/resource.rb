require 'uri'

module GeniusReferrals
  class Resource
    def initialize(client)
      @client = client
    end

    private

    attr_reader :client

    def request(method, path, params: nil, json: nil)
      APIResponse.from_api(client.request(method, path, params: params, json: json))
    end

    def page(method, path, params: nil)
      Page.from_api(client.request(method, path, params: params))
    end

    def each_page(path, page_number: 1, limit: 100, params: nil)
      return enum_for(:each_page, path, page_number: page_number, limit: limit, params: params) unless block_given?

      current = page_number
      loop do
        response = page('GET', path, params: compact((params || {}).merge(page: current, limit: limit)))
        response.results.each { |item| yield item }
        break if response.total.nil? || response.results.empty?
        break if current * limit >= response.total.to_i

        current += 1
      end
    end

    def compact(hash)
      hash.each_with_object({}) do |(key, value), result|
        result[key] = value unless value.nil?
      end
    end

    def wrapped(name, payload)
      { name => payload.to_h }
    end

    def esc(value)
      URI.encode_www_form_component(value.to_s)
    end
  end
end
