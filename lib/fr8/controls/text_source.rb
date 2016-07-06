# frozen_string_literal: true
module Fr8
  module Controls
    # TODO: Describe this class
    class TextSource < CamelizedJSON
      attr_accessor :type, :initial_label, :upstream_source_label, :text_value,
                    :value_source

      def initialize(
        initial_label:, upstream_source_label:, text_value:, value_source:
      )
        # TODO: test this .merge!
        method(__method__).parameters[type: ControlType::TEXT_SOURCE]

        super(method(__method__).parameters)
      end
    end
  end
end
