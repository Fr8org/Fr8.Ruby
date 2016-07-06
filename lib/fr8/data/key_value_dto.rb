# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class KeyValueDTO < CamelizedJSON
      attr_accessor :key, :value, :tags

      def initialize(key:, value:, tags:)
        super(method(__method__).parameters)
      end
    end
  end
end
