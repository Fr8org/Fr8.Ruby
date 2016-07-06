# frozen_string_literal: true
module Fr8
  module Controls
    # TODO: Describe this class
    class ControlSource < CamelizedJSON
      attr_accessor :manifest_type, :label, :filter_by_tag,
                    :request_upstream, :availability_type

      def initialize(
        manifest_type:, label:, filter_by_tag:, request_upstream:,
        availability_type:
      )
        super(method(__method__).parameters)
      end
    end
  end
end
