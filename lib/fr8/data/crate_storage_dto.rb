# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class CrateStorageDTO < PropertyInitializer
      attr_accessor :crates

      def initialize(crates: [])
        super(method(__method__).parameters)
      end
    end
  end
end
