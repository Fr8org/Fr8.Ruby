# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class AuthorizationTokenDTO < CamelizedJSONCapitalized
      attr_accessor :user_id, :token, :external_account_id,
                    :external_state_token

      def initialize(
        user_id:, token:, external_account_id:, external_state_token:
      )
        super(method(__method__).parameters)
      end
    end
  end
end
