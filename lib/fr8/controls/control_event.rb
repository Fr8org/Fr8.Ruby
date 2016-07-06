# frozen_string_literal: true
module Fr8
  module Controls
    # TODO: Describe this class
    class ControlEvent < CamelizedJSON
      attr_accessor :name, :handler

      def initialize(name:, handler:)
        super(method(__method__).parameters)
      end
    end
  end
end
