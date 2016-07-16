# frozen_string_literal: true
module Fr8
  module Manifests
    # TODO: Describe this class
    class StandardConfigurationControlsCM < CamelizedJSONCapitalized
      attr_accessor :manifest_type, :manifest_id, :controls

      def initialize(controls: [])
        self.manifest_type =
          ManifestType::STANDARD_CONFIGURATION_CONTROLS[:type]
        self.manifest_id = ManifestType::STANDARD_CONFIGURATION_CONTROLS[:id]
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      def self.from_fr8_json(fr8_json)
        hash = hash_from_fr8_json(fr8_json)
        controls =
          hash[:controls].map { |c| Fr8::Controls.extract_control(c) }

        new(controls: controls)
      end

      def as_json(opts={})
        opts[:except] ||= ['manifest_type', 'manifest_id']
        super(opts)
      end
    end
  end
end
