# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class ExternalAuthURLDTO < CamelizedJSONCapitalized
      attr_accessor :state_token, :url

      def initialize(state_token:, url:)
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end
    end
  end
end
