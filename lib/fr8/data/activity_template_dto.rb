# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class ActivityTemplateDTO < CamelizedJSON
      attr_accessor :id, :name, :version, :terminal, :web_service,
                    :activity_category, :needs_authentication, :label,
                    :activity_type, :min_pane_width

      def initialize(
        id:, name:, version:, terminal:, web_service:, activity_category:,
        needs_authenticaton: false, label: '',
        activity_type: ActivityType::STANDARD, min_pane_width: 380
      )
        super(method(__method__).parameters)
      end
    end
  end
end
