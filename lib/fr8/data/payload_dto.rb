# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class PayloadDTO < CamelizedJSON
      attr_accessor :crate_storage, :container_id

      def initialize(crate_storage:, container_id:)
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end
    end
  end
end
