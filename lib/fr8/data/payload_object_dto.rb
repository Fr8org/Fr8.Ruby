# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class PayloadObjectDTO < CamelizedJSONCapitalized
      attr_accessor :payload_object

      def initialize(payload_object: [])
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end
    end
  end
end
