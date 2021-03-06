# frozen_string_literal: true
module Fr8
  # TODO: Document
  module Manifests
    MANIFEST_CM = {
      ManifestType::OPERATIONAL_STATE[:id] =>
        OperationalStateCM,
      ManifestType::STANDARD_CONFIGURATION_CONTROLS[:id] =>
        StandardConfigurationControlsCM,
      ManifestType::STANDARD_PAYLOAD_DATA[:id] =>
        StandardPayloadDataCM
    }.freeze

    def self.extract_manifest(manifest_id:, fr8_json:)
      MANIFEST_CM[manifest_id].try(:from_fr8_json, fr8_json)
    end
  end
end
