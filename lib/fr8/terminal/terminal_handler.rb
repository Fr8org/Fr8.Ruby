# frozen_string_literal: true
module Fr8
  # TODO: Document
  class TerminalHandler < PropertyInitializer
    attr_accessor :terminal, :hub_factory, :authentication_handler,
                  :activity_store, :activities

    def initialize(
      terminal:, hub_factory: Hub.create_default_hub,
      activity_store: ActivityStore.new, activities: nil,
      authentication_handler: nil
    )
      super(method(__method__).parameters)

      return if activities.nil?

      activities.each do |activity|
        self.activity_store.register_activity(
          activity_template: activity[0],
          activity_handler: activity[1]
        )
      end
    end

    def discover
      StandardFr8TerminalCM.new(
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
      fr8_data = Fr8DataDTO.from_request_json(params)
      activity_handler = activity_store.instantiate_activity_handler(
        fr8_data.activity.activity_template
      )
      activity_handler.send(action)
      fr8_data
    end
  end
end
