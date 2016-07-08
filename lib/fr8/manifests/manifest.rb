# frozen_string_literal: true
module Fr8
  module Manifests
    # TODO: Describe this class
    class Manifest
      attr_accessor :manifest_type, :manifest_id

      def initialize(manifest_type:, manifest_id:)
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end
    end
  end
end
