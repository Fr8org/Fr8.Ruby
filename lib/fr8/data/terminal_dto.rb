# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class TerminalDTO < CamelizedJSON
      attr_accessor :id, :name, :label, :version, :terminal_status,
                    :endpoint, :description, :authentication_type

      def initialize(
        id:, name:, label:, version:, endpoint:, description:,
        terminal_status: TerminalStatus::ACTIVE,
        authentication_type: AuthenticationType::NONE
      )
        super(method(__method__).parameters)
      end
    end
  end
end
