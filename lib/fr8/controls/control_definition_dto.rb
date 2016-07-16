# frozen_string_literal: true
module Fr8
  module Controls
    # TODO: Describe this class
    class ControlDefinitionDTO < CamelizedJSON
      attr_accessor :name, :label, :required, :value, :type, :selected,
                    :events, :source, :is_hidden, :is_collapsed

      def initialize(
        name:, label:, value:, type:, source:, required: false,
        selected: false, events: [], is_hidden: false, is_collapsed: false
      )
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end
    end
  end
end
