# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class ExternalAuthURLDTO < CamelizedJSONCapitalized
      attr_accessor :state_token, :url

      def initialize(state_token:, url:)
        super(method(__method__).parameters)
      end
    end
  end
end
