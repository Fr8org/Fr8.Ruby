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
        # TODO: test this .merge!
        method(__method__).parameters[type: ControlType::DROP_DOWN_LIST]

        super(method(__method__).parameters)
      end
    end
  end
end
