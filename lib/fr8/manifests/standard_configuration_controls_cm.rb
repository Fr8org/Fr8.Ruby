# frozen_string_literal: true
module Fr8
  module Manifests
    # TODO: Describe this class
    class StandardConfigurationControlsCM < CamelizedJSONCapitalized
      attr_accessor :manifest_type, :manifest_id, :controls

      def initialize(controls: [])
        # TODO: test this .merge!
        method(__method__).parameters.merge!(
          manifest_type: ManifestType::STANDARD_CONFIGURATION_CONTROLS[:type],
          manifest_id: Manifest::STANDARD_CONFIGURATION_CONTROLS[:id]
        )
        super(method(__method__).parameters)
      end
    end
  end
end
