# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class ActivityResponseDTO < PropertyInitializer
      attr_accessor :type, :body

      def initialize(type:, body:)
        super(method(__method__).parameters)
      end
    end
  end
end
