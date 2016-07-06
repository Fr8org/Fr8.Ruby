# frozen_string_literal: true
module Fr8
  module Controls
    # TODO: Describe this class
    class ControlDefinitionDTO < PropertyInitializer
      attr_accessor :name, :label, :required, :value, :type, :selected,
                    :events, :source, :is_hidden, :is_collapsed

      def initialize(
        name:, label:, value:, type:, source:, required: false,
        selected: false, events: [], is_hidden: false, is_collapsed: false
      )
        super(method(__method__).parameters)
      end
    end
  end
end
