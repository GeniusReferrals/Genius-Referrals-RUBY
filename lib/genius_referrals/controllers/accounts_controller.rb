# This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ).

module GeniusReferrals
  class AccountsController < BaseController
    @@instance = AccountsController.new
    # Singleton instance of the controller class
    def self.instance
      @@instance
    end

    # Get an account by a given slug.
    # @param [String] account_slug Required parameter: The account identifier
    # @return Mixed response from the API call
    def get_account(account_slug)

      # prepare query url
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/accounts/{account_slug}'
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'account_slug' => account_slug
      }
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => Configuration.content_type
      }

      # prepare and execute HttpRequest
      _request = @http_client.get _query_url, headers: _headers
      CustomHeaderAuth.apply(_request)
      _context = execute_request(_request)
      validate_response(_context)

      # return appropriate response type
      decoded = APIHelper.json_deserialize(_context.response.raw_body) if not (_context.response.raw_body.nil? or _context.response.raw_body.to_s.strip.empty?)
      return decoded
    end

    # Get the list of accounts.
    # @param [Integer] page Optional parameter: Page number, e.g. 1 would start at the first result, and 10 would start at the tenth result.
    # @param [Integer] limit Optional parameter: Maximum number of results to return in the response. Default (10), threshold (100)
    # @param [String] filter Optional parameter: Allowed fields: name. Use the following delimiters to build your filters params. The vertical bar ('\|') to separate individual filter phrases and a double colon ('::') to separate the names and values. The delimiter of the double colon (':') separates the property name from the comparison value, enabling the comparison value to contain spaces. Example: www.example.com/users?filter='name::todd\|city::denver\|title::grand poobah'
    # @param [String] sort Optional parameter: Allowed fields: name, created. Use sort query-string parameter that contains a delimited set of property names. For each property name, sort in ascending order, and for each property prefixed with a dash ('-') sort in descending order. Separate each property name with a vertical bar ('\|'), which is consistent with the separation of the name\|value pairs in filtering, above. For example, if we want to retrieve users in order of their last name (ascending), first name (ascending) and hire date (descending), the request might look like this www.example.com/users?sort=last_name\|first_name\|-hire_date
    # @return Mixed response from the API call
    def get_accounts(page = 1, 
                     limit = 10, 
                     filter = nil, 
                     sort = nil)

      # prepare query url
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/accounts'
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'page' => page,
        'limit' => limit,
        'filter' => filter,
        'sort' => sort
      }
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => Configuration.content_type
      }

      # prepare and execute HttpRequest
      _request = @http_client.get _query_url, headers: _headers
      CustomHeaderAuth.apply(_request)
      _context = execute_request(_request)
      validate_response(_context)

      # return appropriate response type
      decoded = APIHelper.json_deserialize(_context.response.raw_body) if not (_context.response.raw_body.nil? or _context.response.raw_body.to_s.strip.empty?)
      return decoded
    end
  end
end
