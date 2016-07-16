# frozen_string_literal: true
module Fr8
  module Controls
    # TODO: Describe this class
    class TextBox < ControlDefinitionDTO
      def initialize(
        name:, label:, events: [], required: false, selected: false, value: nil
      )
        self.type = ControlType::TEXT_BOX

        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      def self.from_fr8_json(fr8_json)
        hash = hash_from_fr8_json(fr8_json)

        new(**hash)
      end
    end
  end
end
