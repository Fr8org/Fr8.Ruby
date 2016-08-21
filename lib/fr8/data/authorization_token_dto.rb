# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class AuthorizationTokenDTO < CamelizedJSONCapitalized
      attr_accessor :user_id, :token, :external_account_id,
                    :external_state_token, :id, :external_account_name,
                    :external_domain_id, :external_domain_name,
                    :additional_attributes, :error, :expires_at,
                    :auth_completed_notification_required, :terminal_id

      def initialize(
        token:, external_state_token:, user_id: nil, external_account_id: nil,
        id: nil, external_account_name: nil, external_domain_id: nil,
        external_domain_name: nil, additional_attributes: nil, error: nil,
        expires_at: nil, auth_completed_notification_required: false,
        terminal_id: nil
      )
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      def self.from_fr8_json(fr8_json)
        hash = hash_from_fr8_json(fr8_json)

        new(**hash)
      end
    end
  end
end
