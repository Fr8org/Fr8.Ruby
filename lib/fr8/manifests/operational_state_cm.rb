# frozen_string_literal: true
module Fr8
  module Manifests
    # TODO: Describe this class
    class OperationalStateCM < CamelizedJSONCapitalized
      attr_accessor :manifest_type, :manifest_id, :current_activity_response

      def initialize(activity_response:)
        # TODO: test this .merge!
        method(__method__).parameters.merge!(
          manifest_type: ManifestType::OPERATIONAL_STATE[:type],
          manifest_id: Manifest::OPERATIONAL_STATE[:id]
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
