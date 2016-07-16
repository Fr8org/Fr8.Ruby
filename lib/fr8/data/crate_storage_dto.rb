# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class CrateStorageDTO
      attr_accessor :crates

      def initialize(crates: [])
        method(__method__).parameters.each do |type, k|
          next unless type.to_s.starts_with?('key')
          v = eval(k.to_s)
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      def all_crates_of_type(manifest_id)
        crates.select { |c| c.manifest_id == manifest_id }
      end

      def first_crate_of_type(manifest_id)
        all_crates_of_type(manifest_id).first
      end

      def self.from_fr8_json(fr8_json)
        json_crates = fr8_json.fetch(:crates, [])
        crates = json_crates.map { |c| CrateDTO.from_fr8_json(c) }

        new(crates: crates)
      end
    end
  end
end
