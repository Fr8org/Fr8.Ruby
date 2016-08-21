# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class Fr8DataDTO < CamelizedJSONCapitalized
      attr_accessor :activity_dto, :container_id, :explicit_data, :termial

      def initialize(
        container_id: nil, activity_dto: nil, explicit_data: nil,
        terminal: nil
      )
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      def self.from_fr8_json(fr8_json)
        hash = hash_from_fr8_json(fr8_json)
        unless hash[:activity_dto].nil?
          hash[:activity_dto] = ActivityDTO.from_fr8_json(hash[:activity_dto])
        end

        new(hash)
      end

      def as_json(opts)
        hash = super(opts)
        hash['ActivityDTO'] = hash.delete('ActivityDto')
        hash
      end
    end
  end
end
