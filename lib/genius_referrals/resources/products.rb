module GeniusReferrals
  class ProductsResource < Resource
    # List products for an account.
    def list(account_slug, page: 1, limit: 10, filter: nil, sort: nil)
      page('GET',
           "/accounts/#{esc(account_slug)}/products",
           params: compact(page: page, limit: limit, filter: filter, sort: sort))
    end

    # Create a product using the `product` wrapper.
    def create(account_slug, product)
      request('POST', "/accounts/#{esc(account_slug)}/products", json: wrapped('product', product))
    end

    # Retrieve one product.
    def retrieve(account_slug, product_slug, filter: nil)
      request('GET',
              "/accounts/#{esc(account_slug)}/products/#{esc(product_slug)}",
              params: compact(filter: filter))
    end

    # Replace a product using the `product` wrapper.
    def update(account_slug, product_slug, product)
      request('PUT',
              "/accounts/#{esc(account_slug)}/products/#{esc(product_slug)}",
              json: wrapped('product', product))
    end

    # Patch a product with unwrapped partial fields.
    def patch(account_slug, product_slug, **fields)
      request('PATCH', "/accounts/#{esc(account_slug)}/products/#{esc(product_slug)}", json: fields)
    end

    # Delete one product.
    def delete(account_slug, product_slug)
      request('DELETE', "/accounts/#{esc(account_slug)}/products/#{esc(product_slug)}")
    end

    # List product variants.
    def variants(account_slug, product_slug, page: 1, limit: 10)
      page('GET',
           "/accounts/#{esc(account_slug)}/products/#{esc(product_slug)}/variants",
           params: { page: page, limit: limit })
    end

    # Create a product variant.
    def create_variant(account_slug, product_slug, variant)
      request('POST',
              "/accounts/#{esc(account_slug)}/products/#{esc(product_slug)}/variants",
              json: wrapped('variant', variant))
    end

    # Retrieve one product variant.
    def retrieve_variant(account_slug, product_slug, variant_id, filter: nil)
      request('GET',
              "/accounts/#{esc(account_slug)}/products/#{esc(product_slug)}/variants/#{esc(variant_id)}",
              params: compact(filter: filter))
    end

    # Replace one product variant.
    def update_variant(account_slug, product_slug, variant_id, variant)
      request('PUT',
              "/accounts/#{esc(account_slug)}/products/#{esc(product_slug)}/variants/#{esc(variant_id)}",
              json: wrapped('variant', variant))
    end

    # Patch one product variant with unwrapped partial fields.
    def patch_variant(account_slug, product_slug, variant_id, **fields)
      request('PATCH',
              "/accounts/#{esc(account_slug)}/products/#{esc(product_slug)}/variants/#{esc(variant_id)}",
              json: fields)
    end

    # Delete one product variant.
    def delete_variant(account_slug, product_slug, variant_id)
      request('DELETE', "/accounts/#{esc(account_slug)}/products/#{esc(product_slug)}/variants/#{esc(variant_id)}")
    end

    # Patch a variant price with the live-doc unwrapped `amount` field.
    def patch_variant_price(account_slug, product_slug, variant_id, currency_code, amount:)
      request('PATCH',
              "/accounts/#{esc(account_slug)}/products/#{esc(product_slug)}/variants/#{esc(variant_id)}/prices/#{esc(currency_code)}",
              json: { 'amount' => amount })
    end
  end
end
