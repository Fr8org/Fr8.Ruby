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
        self.type = ControlType::TEXT_SOURCE

        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end
    end
  end
end
