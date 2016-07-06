# frozen_string_literal: true
module Fr8
  module Manifests
    # TODO: Describe this class
    class StandardFr8TerminalCM < CamelizedJSON
      attr_accessor :manifest_type, :manifest_id, :definition, :activities

      def initialize(definition: nil, activities: [])
        # TODO: test this .merge!
        method(__method__).parameters.merge!(
          manifest_type: ManifestType::STANDARD_FR8_TERMINAL[:type],
          manifest_id: Manifest::STANDARD_FR8_TERMINAL[:id]
        )
        super(method(__method__).parameters)
      end

      def set_success_response!
        self.current_activity_response ||=
          ActivityResponseDTO.new(type: 'Success')
      end
    end
  end
end
