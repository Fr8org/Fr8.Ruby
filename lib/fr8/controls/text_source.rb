# frozen_string_literal: true
module Fr8
  module Controls
    # TODO: Describe this class
    class TextSource < DropDownList
      attr_accessor :initial_label, :upstream_source_label, :text_value,
                    :value_source

      def initialize(
        name:, message_source:, initial_label:, label: nil, required: false,
        upstream_source_label: nil, text_value: nil, value_source: nil
      )
        self.type = ControlType::TEXT_SOURCE

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
