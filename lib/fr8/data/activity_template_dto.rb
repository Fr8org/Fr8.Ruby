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
        needs_authentication: false, label: '',
        activity_type: ActivityType::STANDARD, min_pane_width: 380
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
