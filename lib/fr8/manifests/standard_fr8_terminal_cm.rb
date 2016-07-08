# frozen_string_literal: true
module Fr8
  module Manifests
    # TODO: Describe this class
    class StandardFr8TerminalCM < CamelizedJSON
      attr_accessor :manifest_type, :manifest_id, :definition, :activities

      def initialize(definition: nil, activities: [])
        self.manifest_type = ManifestType::STANDARD_FR8_TERMINAL[:type]
        self.manifest_id = ManifestType::STANDARD_FR8_TERMINAL[:id]

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
    end
  end
end
