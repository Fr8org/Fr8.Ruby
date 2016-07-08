# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class CrateDTO < CamelizedJSON
      attr_accessor :manifest_type, :manifest_id, :manifest_registrar,
                    :id, :label, :contents, :parent_crate_id,
                    :create_time, :availability_type

      def initialize(
        manifest_type:, manifest_id:, manifest_registrar:, id:,
        label:, contents:, parent_crate_id:, create_time:,
        availability_type: AvailabilityType::NOTSET
      )
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end
    end
  end
end
