# Genius Referrals Ruby SDK

Official Ruby SDK for the Genius Referrals public API.

This rebuild is based on the accepted public API contract matrix from
`alainhl/gr-agent-led-dev-delivery#14` and is the first implementation slice for
`GeniusReferrals/Genius-Referrals-RUBY#2`.

## Install

```bash
gem install genius_referrals
```

For local validation from this repository:

```bash
gem build genius_referrals.gemspec
gem install ./genius_referrals-0.1.0.gem
```

## Authentication

The API uses the `X-Auth-Token` header. The SDK redacts the token from exception
request snapshots and never includes it in error messages.

```ruby
require 'genius_referrals'

client = GeniusReferrals::Client.new(auth_token: 'gr_live_or_test_token')
result = client.authentications.test
puts result.data
```

The default base URL is `https://api.geniusreferrals.com`.

## Resource Examples

List advocates:

```ruby
page = client.advocates.list('my-account', page: 1, limit: 25)

page.results.each do |advocate|
  puts [advocate['token'], advocate['email']].compact.join(' ')
end
```

Create an advocate with the accepted wrapper:

```ruby
client.advocates.create(
  'my-account',
  {
    name: 'Ada',
    lastname: 'Lovelace',
    email: 'ada@example.com'
  }
)
```

Patch a bonus with unwrapped partial fields:

```ruby
client.bonuses.patch('my-account', 1234, status: 'approved')
```

Call a report:

```ruby
client.reports.revenue(
  account_slug: 'my-account',
  start_date: '2026-01-01',
  end_date: '2026-01-31'
)
```

## Pagination

Collection helpers return a `GeniusReferrals::Page` object when the response
uses the standard `limit`, `page`, `total`, and `results` shape.

```ruby
client.advocates.each('my-account', limit: 100) do |advocate|
  process(advocate)
end
```

The SDK preserves API parameter names from the accepted matrix: `page` is sent
as `page`, and `limit` is sent as `limit`.

## Errors

The SDK raises typed exceptions:

- `GeniusReferrals::AuthenticationError` for HTTP `401`
- `GeniusReferrals::AuthorizationError` for HTTP `403`
- `GeniusReferrals::NotFoundError` for HTTP `404`
- `GeniusReferrals::ConflictError` for HTTP `409`
- `GeniusReferrals::ValidationError` for HTTP `400` and `422`
- `GeniusReferrals::RateLimitError` for HTTP `429`
- `GeniusReferrals::APIError` for other non-success responses
- `GeniusReferrals::TransportError` for local network or serialization failures

All API errors include `status_code`, parsed `response`, raw body text when
available, and redacted request details.

## Guarded Integration Test

Integration tests are opt-in so CI and local development do not use real
credentials by accident:

```bash
GR_SDK_RUN_INTEGRATION=1 GR_API_TOKEN=... ruby -Itest test/integration/authentication_test.rb
```

Do not print or commit the token.

## Package Validation

This ticket does not publish to RubyGems. Validate the candidate locally with:

```bash
ruby -Itest test/client_test.rb test/resources_test.rb
ruby -c lib/genius_referrals.rb
gem build genius_referrals.gemspec
sha256sum genius_referrals-0.1.0.gem
```

Current candidate version: `0.1.0`.

Rollback/removal if an unpublished candidate is bad: delete the local gem from
the repository root, fix the branch, rebuild, and replace the PR evidence.
Public RubyGems publication requires Ledger risk review and Alain approval.
