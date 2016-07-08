# frozen_string_literal: true
module Fr8
  module Manifests
    # TODO: Describe this class
    class StandardPayloadDataCM < CamelizedJSONCapitalized
      attr_accessor :manifest_type, :manifest_id, :name, :object_type,
                    :payload_objects

      def initialize(name:, object_type:, payload_objects: [])
        self.manifest_type = ManifestType::STANDARD_PAYLOAD_DATA[:type]
        self.manifest_id = Manifest::STANDARD_PAYLOAD_DATA[:id]

        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end
    end
  end
end
