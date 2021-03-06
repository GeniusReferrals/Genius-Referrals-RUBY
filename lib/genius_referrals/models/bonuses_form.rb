# This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ).

module GeniusReferrals
  class BonusesForm < BaseModel
    # The bonuses' wrapper
    # @return [Bonuses]
    attr_accessor :bonus

    # A mapping from model property names to API property names
    def self.names
      if @hash.nil?
        @hash = {}
        @hash["bonus"] = "bonus"
      end
      @hash
    end

    def initialize(bonus = nil)
      @bonus = bonus
    end

    # Creates an instance of the object from a hash
    def self.from_hash(hash)
      if hash == nil
        nil
      else
        # Extract variables from the hash
        bonus = Bonuses.from_hash(hash["bonus"]) if hash["bonus"]

        # Create object from extracted values
        BonusesForm.new(bonus)
      end
    end
  end
end
