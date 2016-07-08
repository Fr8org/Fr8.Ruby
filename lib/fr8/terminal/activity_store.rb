# frozen_string_literal: true
module Fr8
  module Terminal
    # TODO: Document
    class ActivityStore
      attr_accessor :activity_templates, :activity_handlers, :str

      def initialize(activity_templates: {}, activity_handlers: {})
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      def register_activity(activity_template:, activity_handler:)
        key = generate_key(activity_template)
        activity_templates[key] = activity_template
        activity_handlers[key] = activity_handler
      end

      def instantiate_activity_handler(activity_template:)
        activity_handlers[generate_key(activity_template)].new
      end

      def activity_templates_arr
        activity_templates.values
      end

      private

      def generate_key(at)
        "#{at.name}_v#{at.version}"
      end
    end
  end
end
