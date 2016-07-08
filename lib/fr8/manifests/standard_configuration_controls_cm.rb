# frozen_string_literal: true
module Fr8
  module Manifests
    # TODO: Describe this class
    class StandardConfigurationControlsCM < CamelizedJSONCapitalized
      attr_accessor :manifest_type, :manifest_id, :controls

      def initialize(controls: [])
        self.manifest_type =
          ManifestType::STANDARD_CONFIGURATION_CONTROLS[:type]
        self.manifest_id = Manifest::STANDARD_CONFIGURATION_CONTROLS[:id]
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end
    end
  end
end
