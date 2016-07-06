# frozen_string_literal: true
module Fr8
  # Fr8 JSON requires CamelCase
  class CamelizedJSONCapitalized < PropertyInitializer
    def as_json(options)
      json = super(options)
      Hash[json.map { |k, v| [k.camelize, v] }]
    end
  end
end
