# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class TerminalDTO < CamelizedJSON
      attr_accessor :id, :name, :label, :version, :terminal_status,
                    :endpoint, :description, :authentication_type

      def initialize(
        id:, name:, label:, version:, endpoint:, description: nil,
        terminal_status: TerminalStatus::ACTIVE,
        authentication_type: AuthenticationType::NONE
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
