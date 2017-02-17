# This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ).

module GeniusReferrals
  class GeniusReferralsClient
    # Singleton access to roots controller
    # @return [RootsController] Returns the controller instance
    def roots
      RootsController.instance
    end

    # Singleton access to authentications controller
    # @return [AuthenticationsController] Returns the controller instance
    def authentications
      AuthenticationsController.instance
    end

    # Singleton access to advocates controller
    # @return [AdvocatesController] Returns the controller instance
    def advocates
      AdvocatesController.instance
    end

    # Singleton access to accounts controller
    # @return [AccountsController] Returns the controller instance
    def accounts
      AccountsController.instance
    end

    # Singleton access to reports controller
    # @return [ReportsController] Returns the controller instance
    def reports
      ReportsController.instance
    end

    # Singleton access to referrals controller
    # @return [ReferralsController] Returns the controller instance
    def referrals
      ReferralsController.instance
    end

    # Singleton access to redemption_requests controller
    # @return [RedemptionRequestsController] Returns the controller instance
    def redemption_requests
      RedemptionRequestsController.instance
    end

    # Singleton access to bonuses controller
    # @return [BonusesController] Returns the controller instance
    def bonuses
      BonusesController.instance
    end

    # Singleton access to campaigns controller
    # @return [CampaignsController] Returns the controller instance
    def campaigns
      CampaignsController.instance
    end

    # Initializer with authentication and configuration parameters
    def initialize(content_type: 'application/json', x_auth_token: '3b9d11374b602fb47b987dff90f1c5940a1f377f')
      Configuration.content_type = content_type if content_type
      Configuration.x_auth_token = x_auth_token if x_auth_token
    end
  end
end