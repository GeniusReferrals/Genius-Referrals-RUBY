module GeniusReferrals
  class WidgetsPackagesResource < Resource
    # List widgets packages.
    def list(account_slug, page: 1, limit: 10)
      page('GET', "/accounts/#{esc(account_slug)}/widgets-packages", params: { page: page, limit: limit })
    end

    # Create a widgets package.
    def create(account_slug, widgets_package)
      request('POST',
              "/accounts/#{esc(account_slug)}/widgets-packages",
              json: wrapped('widgets_package', widgets_package))
    end

    # Retrieve one widgets package.
    def retrieve(account_slug, widgets_package_slug)
      request('GET', "/accounts/#{esc(account_slug)}/widgets-packages/#{esc(widgets_package_slug)}")
    end

    # Replace one widgets package.
    def update(account_slug, widgets_package_slug, widgets_package)
      request('PUT',
              "/accounts/#{esc(account_slug)}/widgets-packages/#{esc(widgets_package_slug)}",
              json: wrapped('widgets_package', widgets_package))
    end

    # Delete one widgets package.
    def delete(account_slug, widgets_package_slug)
      request('DELETE', "/accounts/#{esc(account_slug)}/widgets-packages/#{esc(widgets_package_slug)}")
    end

    # List widgets inside a package.
    def widgets(account_slug, widgets_package_slug, page: 1, limit: 10, filter: nil)
      page('GET',
           "/accounts/#{esc(account_slug)}/widgets-packages/#{esc(widgets_package_slug)}/widgets",
           params: compact(page: page, limit: limit, filter: filter))
    end

    # Create a widget.
    def create_widget(account_slug, widgets_package_slug, widget)
      request('POST',
              "/accounts/#{esc(account_slug)}/widgets-packages/#{esc(widgets_package_slug)}/widgets",
              json: wrapped('widget', widget))
    end

    # Retrieve one widget.
    def retrieve_widget(account_slug, widgets_package_slug, widget_id, filter: nil)
      request('GET',
              "/accounts/#{esc(account_slug)}/widgets-packages/#{esc(widgets_package_slug)}/widgets/#{esc(widget_id)}",
              params: compact(filter: filter))
    end

    # Replace one widget.
    def update_widget(account_slug, widgets_package_slug, widget_id, widget)
      request('PUT',
              "/accounts/#{esc(account_slug)}/widgets-packages/#{esc(widgets_package_slug)}/widgets/#{esc(widget_id)}",
              json: wrapped('widget', widget))
    end

    # Patch a widget with unwrapped partial fields.
    def patch_widget(account_slug, widgets_package_slug, widget_id, **fields)
      request('PATCH',
              "/accounts/#{esc(account_slug)}/widgets-packages/#{esc(widgets_package_slug)}/widgets/#{esc(widget_id)}",
              json: fields)
    end

    # List widget translations from the accepted SDK route text.
    def translations(account_slug, widgets_package_slug, widget_id, page: 1, limit: 10)
      page('GET',
           "/accounts/#{esc(account_slug)}/widgets-packages/#{esc(widgets_package_slug)}/widgets/#{esc(widget_id)}/translations",
           params: { page: page, limit: limit })
    end

    # Create a widget translation using the live-doc `widget` wrapper.
    def create_translation(account_slug, widgets_package_slug, widget_id, widget)
      request('POST',
              "/accounts/#{esc(account_slug)}/widgets-packages/#{esc(widgets_package_slug)}/widgets/#{esc(widget_id)}/translations",
              json: wrapped('widget', widget))
    end

    # Retrieve one widget translation from the accepted SDK route text.
    def retrieve_translation(account_slug, widgets_package_slug, widget_id, locale)
      request('GET',
              "/accounts/#{esc(account_slug)}/widgets-packages/#{esc(widgets_package_slug)}/widgets/#{esc(widget_id)}/translations/#{esc(locale)}")
    end

    # Patch a widget translation with unwrapped partial fields.
    def patch_translation(account_slug, widgets_package_slug, widget_id, locale, **fields)
      request('PATCH',
              "/accounts/#{esc(account_slug)}/widgets-packages/#{esc(widgets_package_slug)}/widgets/#{esc(widget_id)}/translations/#{esc(locale)}",
              json: fields)
    end
  end
end
