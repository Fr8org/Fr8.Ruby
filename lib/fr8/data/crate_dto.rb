# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class CrateDTO < CamelizedJSON
      attr_accessor :manifest_type, :manifest_id, :manifest_registrar,
                    :id, :label, :contents, :parent_crate_id,
                    :create_time, :availability_type, :manufacturer,
                    :source_activity_id

      def initialize(
        manifest_type:, manifest_id:, contents:, id: SecureRandom.uuid,
        manifest_registrar: nil, label: nil, parent_crate_id: nil,
        create_time: nil, manufacturer: nil, source_activity_id: nil,
        availability_type: AvailabilityType::NOTSET
      )
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      def self.from_fr8_json(json_data)
        hash = hash_from_fr8_json(json_data)
        hash[:contents] = Fr8::Manifests.extract_manifest(
          manifest_id: hash[:manifest_id],
          fr8_json: hash[:contents]
        )

        new(**hash)
      end
    end
  end
end
