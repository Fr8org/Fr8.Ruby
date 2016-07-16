# frozen_string_literal: true
module Fr8
  module Manifests
    # TODO: Describe this class
    class OperationalStateCM < CamelizedJSONCapitalized
      attr_accessor :manifest_type, :manifest_id, :current_activity_response

      def initialize(activity_response:)
        self.manifest_type = ManifestType::OPERATIONAL_STATE[:type]
        self.manifest_id = Manifest::OPERATIONAL_STATE[:id]

        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      def set_success_response!
        self.current_activity_response ||=
          ActivityResponseDTO.new(type: 'Success')
      end

      def self.from_fr8_json(fr8_json)
        ardto = Fr8::Data::ActivityResponseDTO.from_fr8_json(fr8_json)

        new(current_activity_response: ardto)
      end
    end
  end
end
