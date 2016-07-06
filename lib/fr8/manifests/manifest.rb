# frozen_string_literal: true
module Fr8
  module Manifests
    # TODO: Describe this class
    class Manifest < PropertyInitializer
      attr_accessor :manifest_type, :manifest_id

      def initialize(manifest_type:, manifest_id:)
        super(method(__method__).parameters)
      end
    end
  end
end
