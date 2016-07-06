# frozen_string_literal: true
module Fr8
  # Fr8 JSON requires CamelCase
  class CamelizedJSON < PropertyInitializer
    def as_json(options)
      json = super(options)
      Hash[json.map { |k, v| [k.camelize(:lower), v] }]
    end
  end
end
