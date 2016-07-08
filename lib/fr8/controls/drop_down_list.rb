# frozen_string_literal: true
module Fr8
  module Controls
    # TODO: Describe this class
    class DropDownList < CamelizedJSON
      attr_accessor :type, :list_items, :selected_key, :has_refresh_button,
                    :selected_item

      def initialize(
        selected_key:, selected_item:, list_items: [],
        has_refresh_button: false
      )
        self.type = ControlType::DROP_DOWN_LIST

        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end
    end
  end
end
