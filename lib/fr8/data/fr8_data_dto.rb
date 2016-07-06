# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class Fr8DataDTO < CamelizedJSONCapitalized
      attr_accessor :activity, :container_id

      def initialize(activity: nil, container_id:)
        super(method(__method__).parameters)
      end
    end
  end
end
