# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class PayloadDTO < CamelizedJSON
      attr_accessor :crate_storage, :container_id

      def initialize(crate_storage:, container_id:)
        super(method(__method__).parameters)
      end
    end
  end
end
