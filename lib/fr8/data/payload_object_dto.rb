# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class PayloadObjectDTO < CamelizedJSONCapitalized
      attr_accessor :payload_object

      def initialize(payload_object: [])
        super(method(__method__).parameters)
      end
    end
  end
end
