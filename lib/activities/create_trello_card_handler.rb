# frozen_string_literal: true
module Activities
  # TODO: Document
  class CreateTrelloCardHandler
    include Fr8::Data
    include Fr8::Manifests
    include Fr8::Controls

    def configure(fr8_json:, fr8_data:)
      # grab controls crate from data
      controls_crate =
        fr8_data.activity_dto.crate_storage.first_crate_of_type(
          ManifestType::STANDARD_CONFIGURATION_CONTROLS
        )

      unless controls_crate.nil?
        # TODO: handle subsequent configuration
      end

      # add controls on initial call
      fr8_data.activity_dto.crate_storage.crates << Fr8::Data::CrateDTO.new(
        manifest_id: ManifestType::STANDARD_CONFIGURATION_CONTROLS[:id],
        manifest_type: ManifestType::STANDARD_CONFIGURATION_CONTROLS[:type],
        contents: StandardConfigurationControlsCM.new(
          controls: [
            TextSource.new(
              name: 'name',
              label: 'Name',
              initial_label: 'Name',
              required: true,
              message_source: ControlSource.new(
                manifest_type: ManifestType::FIELD_DESCRIPTION[:type],
                request_upstream: true
              )
            ),
            TextSource.new(
              name: 'description',
              label: 'Description',
              initial_label: 'Description',
              message_source: ControlSource.new(
                manifest_type: ManifestType::FIELD_DESCRIPTION[:type],
                request_upstream: true
              )
            )
          ]
        )
      )

      fr8_data.activity_dto
    end
  end
end
