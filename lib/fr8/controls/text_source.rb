# frozen_string_literal: true
module Fr8
  module Controls
    # TODO: Describe this class
    class TextSource < DropDownList
      attr_accessor :name, :message_source, :initial_label, :label, :required,
                    :upstream_source_label, :text_value, :value_source,
                    :group_label_text, :has_value, :has_upstream_value,
                    :has_specific_value, :value_source_is_not_set,
                    :list_items, :selected_key, :has_refresh_button,
                    :selected_item, :value, :type, :selected, :events,
                    :source, :show_documentation, :is_hidden, :is_collapsed

      def initialize(
        name:, initial_label:, message_source: nil, label: nil,
        required: false, upstream_source_label: nil, text_value: nil,
        value_source: nil, group_label_text: nil, has_value: nil,
        has_upstream_value: nil, has_specific_value: nil,
        value_source_is_not_set: nil, list_items: nil, selected_key: nil,
        has_refresh_button: nil, selected_item: nil, value: nil, type: nil,
        selected: nil, events: nil, source: nil, show_documentation: nil,
        is_hidden: nil, is_collapsed: nil
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
