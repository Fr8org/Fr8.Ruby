# frozen_string_literal: true
module Fr8
  # TODO: Document
  module Controls
    CONTROL_TYPES = {
      ControlType::DROP_DOWN_LIST => DropDownList,
      ControlType::TEXT_SOURCE => TextSource
    }.freeze

    def extract_control(control_type:, fr8_json:)
      CONTROL_TYPES[control_type].try(:from_fr8_json, fr8_json)
    end
  end
end
