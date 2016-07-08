# frozen_string_literal: true
module Fr8
  # TODO: Document
  class Hub
    attr_accessor :hub_url, :terminal_id, :terminal_secret, :container_id,
                  :user_id

    def initialize(
      hub_url:, terminal_id:, terminal_secret:, container_id:, user_id:
    )
      method(__method__).parameters.each do |type, k|
        next unless type.to_s.starts_with?('key')
        v = eval(k.to_s)
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def self.create_default_hub; end
  end
end
