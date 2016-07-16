# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class ActivityDTO < CamelizedJSON
      attr_accessor :name, :label, :activity_template, :root_plan_node_id,
                    :parent_plan_node_id, :current_view, :ordering, :id,
                    :crate_storage, :children_activities, :auth_token_id,
                    :auth_token, :documentation

      def initialize(
        name:, label:, activity_template:, root_plan_node_id:,
        parent_plan_node_id:, current_view:, ordering:, id:,
        auth_token_id:, auth_token:, documentation: nil,
        crate_storage: CrateStorageDTO.new, children_activities: []
      )
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      def self.from_fr8_json(fr8_json)
        hash = hash_from_fr8_json(fr8_json)
        hash.merge!(
          activity_template:
            ActivityTemplateDTO.from_fr8_json(hash[:activity_template]),
          children_activities:
            hash.fetch(:children_activities, []).map do |ca|
              ActivityDTO.from_fr8_json(ca)
            end,
          crate_storage:
            CrateStorageDTO.from_fr8_json(hash[:crate_storage] || {})
        )
        unless hash[:auth_token_id].nil?
          hash[:auth_token] =
            AuthorizationTokenDTO.from_fr8_json(hash[:auth_token])
        end

        new(hash)
      end
    end
  end
end
