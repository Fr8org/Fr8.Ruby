# frozen_string_literal: true
module Fr8
  # Handle initialization of properties in constructor
  class PropertyInitializer
    def initialize(*)
      method(__method__).parameters.each do |type, k|
        next unless type == :key
        v = eval(k.to_s)
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end
end
