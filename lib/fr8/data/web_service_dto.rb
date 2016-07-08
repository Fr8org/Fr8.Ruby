# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class WebServiceDTO < CamelizedJSON
      attr_accessor :name, :icon_path

      def initialize(name:, icon_path:)
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end
    end
  end
end
