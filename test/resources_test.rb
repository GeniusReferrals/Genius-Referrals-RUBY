require_relative 'test_helper'

class ResourcesTest < Minitest::Test
  def test_advocate_create_uses_wrapper
    transport = FakeTransport.new([response(201, '{"code":201,"data":{"token":"a1"}}')])
    client = GeniusReferrals::Client.new(
      auth_token: 'token',
      transport: transport,
      base_url: 'https://api.example.test'
    )

    client.advocates.create('acct', { email: 'a@example.com' })

    request = transport.requests.first
    assert_equal('POST', request[:method])
    assert_equal('https://api.example.test/accounts/acct/advocates', request[:url])
    assert_equal({ 'advocate' => { 'email' => 'a@example.com' } }, JSON.parse(request[:body]))
  end

  def test_bonus_patch_is_unwrapped
    transport = FakeTransport.new([response(204)])
    client = GeniusReferrals::Client.new(auth_token: 'token', transport: transport)

    result = client.bonuses.patch('acct', 123, status: 'approved')

    assert_nil(result.data)
    assert_equal('PATCH', transport.requests.first[:method])
    assert_equal({ 'status' => 'approved' }, JSON.parse(transport.requests.first[:body]))
  end

  def test_list_query_preserves_page_and_limit
    transport = FakeTransport.new([
      response(200, '{"code":200,"data":{"page":2,"limit":25,"total":0,"results":[]}}')
    ])
    client = GeniusReferrals::Client.new(
      auth_token: 'token',
      transport: transport,
      base_url: 'https://api.example.test'
    )

    page = client.accounts.list(page: 2, limit: 25, filter: 'status=active')

    assert_equal(2, page.page)
    assert_includes(transport.requests.first[:url], 'page=2')
    assert_includes(transport.requests.first[:url], 'limit=25')
    assert_includes(transport.requests.first[:url], 'filter=status%3Dactive')
  end

  def test_report_accepts_live_and_sdk_parameter_names
    transport = FakeTransport.new([response(200, '{"code":200,"data":[]}')])
    client = GeniusReferrals::Client.new(
      auth_token: 'token',
      transport: transport,
      base_url: 'https://api.example.test'
    )

    client.reports.revenue(
      client_account_slug: 'acct',
      start_date: '2026-01-01',
      end_date: '2026-01-31'
    )

    assert_includes(transport.requests.first[:url], 'client_account_slug=acct')
  end

  def test_product_variant_price_patch_uses_unwrapped_amount
    transport = FakeTransport.new([response(204)])
    client = GeniusReferrals::Client.new(auth_token: 'token', transport: transport)

    client.products.patch_variant_price('acct', 'sku', 123, 'USD', amount: 19.95)

    assert_equal({ 'amount' => 19.95 }, JSON.parse(transport.requests.first[:body]))
  end

  def test_bonus_tag_uses_nested_bonus_tag_shape
    transport = FakeTransport.new([response(201, '{"code":201,"data":{}}')])
    client = GeniusReferrals::Client.new(auth_token: 'token', transport: transport)

    client.bonuses.add_tag('acct', 123, 'vip')

    assert_equal({ 'bonus' => { 'tag' => { 'slug' => 'vip' } } }, JSON.parse(transport.requests.first[:body]))
  end
end
