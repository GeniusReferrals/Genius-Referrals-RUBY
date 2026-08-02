module GeniusReferrals
  class RootResource < Resource
    # Retrieve API root links.
    def retrieve
      request('GET', '/')
    end
  end
end
