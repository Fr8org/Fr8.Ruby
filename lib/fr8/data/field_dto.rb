# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class FieldDTO < CamelizedJSON
      attr_accessor :name, :label, :field_type, :is_required, :tags,
                    :availability, :data

      def initialize(
        name:, label:, field_type:, is_required: false, tags:,
        availability:, data: {}
      )
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      def self.from_fr8_json(fr8_json)
        defaults = {
          is_required: false,
          availability: AvailabilityType::NOTSET,
          data: {}
        }
        hash = defaults.merge(hash_from_fr8_json(fr8_json))

        new(**hash)
      end
    end
  end
end
