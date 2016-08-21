# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class ActivityTemplateDTO < CamelizedJSON
      attr_accessor :id, :name, :version, :terminal, :web_service,
                    :activity_category, :needs_authentication, :label, :type,
                    :min_pane_width, :categories, :terminal_name,
                    :terminal_version

      def initialize(
        name:, version:, id: nil, terminal: nil, web_service: nil,
        activity_category: nil, categories: [], needs_authentication: false,
        label: '', tags: nil, type: ActivityType::STANDARD,
        min_pane_width: 380, terminal_name: nil, terminal_version: nil
      )
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      def self.from_fr8_json(fr8_json)
        hash = hash_from_fr8_json(fr8_json)

        # HACK: hub still sends category instead of activity_category
        hash[:activity_category] = hash.delete(:category)

        if hash.key?(:web_service_dto)
          hash[:web_service_dto] =
            WebServiceDTO.from_fr8_json(hash[:web_service_dto])
        end
        if hash.key?(:terminal)
          hash[:terminal] =
            TerminalDTO.from_fr8_json(hash[:terminal])
        end
        unless hash[:categories].nil?
          hash[:categories].map! { |c| ActivityCategoryDTO.from_fr8_json(c) }
        end

        new(hash)
      end
    end
  end
end
