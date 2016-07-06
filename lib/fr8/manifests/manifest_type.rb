# frozen_string_literal: true
module Fr8
  module Manifests
    # TODO: Describe this class
    class ManifestType
      FIELD_DESCRIPTION = {
        type: 'Field Description',
        id: 3
      }.freeze
      KEY_VALUE_LIST = {
        type: 'Key-Value Pairs List', id: 44
      }.freeze
      OPERATIONAL_STATE = {
        type: 'Operational State', id: 27
      }.freeze
      STANDARD_CONFIGURATION_CONTROLS = {
        type: 'Standard UI Controls',
        id: 6
      }.freeze
      STANDARD_FR8_TERMINAL = {
        type: 'Standard Fr8 Terminal',
        id: 23
      }.freeze
      STANDARD_PAYLOAD_DATA = {
        type: 'Standard Payload Data',
        id: 5
      }.freeze
    end
  end
end
