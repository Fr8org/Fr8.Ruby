# frozen_string_literal: true
module Fr8
  # TODO: Document
  module Controls
    CONTROL_TYPES = {
      ControlType::DROP_DOWN_LIST => DropDownList,
      ControlType::TEXT_SOURCE => TextSource
    }.freeze

    def self.extract_control(control_fr8_json)
      control_type = control_fr8_json['type']

      CONTROL_TYPES[control_type].try(:from_fr8_json, control_fr8_json)
    end
  end
end
