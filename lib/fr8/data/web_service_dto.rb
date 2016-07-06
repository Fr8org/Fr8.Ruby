# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class WebServiceDTO < CamelizedJSON
      attr_accessor :name, :icon_path

      def initialize(name:, icon_path:)
        super(method(__method__).parameters)
      end
    end
  end
end
