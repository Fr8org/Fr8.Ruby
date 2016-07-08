# frozen_string_literal: true
module Fr8
  module Controls
    # TODO: Describe this class
    class ControlEvent < CamelizedJSON
      attr_accessor :name, :handler

      def initialize(name:, handler:)
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end

      end
    end
  end
end
