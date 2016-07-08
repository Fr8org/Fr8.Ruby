# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class ActivityDTO < CamelizedJSON
      attr_accessor :name, :label, :activity_template, :root_plan_node_id,
                    :parent_plan_node_id, :current_view, :ordering, :id,
                    :crate_storage, :children_activities, :auth_token_id,
                    :auth_token

      def initialize(
        name:, label:, activity_template:, root_plan_node_id:,
        parent_plan_node_id:, current_view:, ordering:, id:,
        crate_storage: CrateStorageDTO.new, children_activities: [],
        auth_token_id:, auth_token:
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
