# frozen_string_literal: true
module Fr8
  # Fr8 JSON requires CamelCase
  class CamelizedJSONCapitalized
    def as_json(options)
      json = super(options)
      Hash[json.map { |k, v| [k.camelize, v] }]
    end

    def self.hash_from_fr8_json(fr8_json)
      Hash[fr8_json.map { |k, v| [k.underscore.to_sym, v] }]
    end
  end
end
