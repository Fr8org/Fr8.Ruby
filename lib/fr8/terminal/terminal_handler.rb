# frozen_string_literal: true
module Fr8
  module Terminal
    # TODO: Document
    class TerminalHandler
      attr_accessor :terminal, :hub_factory, :authentication_handler,
                    :activity_store, :activities

      def initialize(
        terminal:, hub_factory: Hub.create_default_hub,
        activity_store: ActivityStore.new, activities: nil,
        authentication_handler: nil
      )
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end

        return if activities.nil?

        activities.each do |activity|
          self.activity_store.register_activity(
            activity_template: activity[0],
            activity_handler: activity[1]
          )
        end
      end

      def discover
        Fr8::Manifests::StandardFr8TerminalCM.new(
          definition: terminal,
          activities: activity_store.activity_templates_arr
        )
      end

      def configure(params)
        fr8_data_from_params(params, :configure)
      end

      def activate(params)
        fr8_data_from_params(params, :activate)
      end

      def deactivate(params)
        fr8_data_from_param(params, :deactivate)
      end

      private

      def fr8_data_from_params(params, action)
        fr8_data =
          Fr8::Data::Fr8DataDTO.from_fr8_json(
            params.except(:terminal, :controller, :action)
          )
        activity_handler = activity_store.activity_handler_for(
          fr8_data.activity_dto.activity_template
        )
        activity_handler.send(action, fr8_json: params, fr8_data: fr8_data)
      end
    end
  end
end
