# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class ExternalAuthenticationDTO < PropertyInitializer
      attr_accessor :user_id, :parameters

      def initialize(user_id:, parameters:)
        super(method(__method__).parameters)
      end
    end
  end
end
