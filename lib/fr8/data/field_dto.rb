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
        super(method(__method__).parameters)
      end
    end
  end
end
