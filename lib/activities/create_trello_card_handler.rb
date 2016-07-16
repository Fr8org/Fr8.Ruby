# frozen_string_literal: true
module Activities
  # TODO: Document
  class CreateTrelloCardHandler
    def configure(fr8_json:, fr8_data:)
      controls_crate =
        fr8_data.activity_dto.crate_storage.first_crate_of_type(
          Fr8::Manifests::ManifestType::STANDARD_CONFIGURATION_CONTROLS
        )

      if controls_crate.nil?
        message = Fr8::Controls::TextBox.new(
          name: 'card_name',
          label: 'Card Name',
          required: true
        )
      end

      controls =
        Fr8::Manifests::StandardConfigurationControlsCM.new(controls: [message])

      controls_crate = Fr8::Data::CrateDTO.new(
        manifest_id:
          Fr8::Manifests::ManifestType::STANDARD_CONFIGURATION_CONTROLS[:id],
        manifest_type:
          Fr8::Manifests::ManifestType::STANDARD_CONFIGURATION_CONTROLS[:type],
        contents: controls
      )

      fr8_data.activity_dto.crate_storage.crates << controls_crate

      fr8_data.activity_dto
    end
  end
end
