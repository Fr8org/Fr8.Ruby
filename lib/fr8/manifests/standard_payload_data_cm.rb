# frozen_string_literal: true
module Fr8
  module Manifests
    # TODO: Describe this class
    class StandardPayloadDataCM < CamelizedJSONCapitalized
      attr_accessor :manifest_type, :manifest_id, :name, :object_type,
                    :payload_objects

      def initialize(name:, object_type:, payload_objects: [])
        # TODO: test this .merge!
        method(__method__).parameters.merge!(
          manifest_type: ManifestType::STANDARD_PAYLOAD_DATA[:type],
          manifest_id: Manifest::STANDARD_PAYLOAD_DATA[:id]
        )
        super(method(__method__).parameters)
      end
    end
  end
end
