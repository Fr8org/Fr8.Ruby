# frozen_string_literal: true
module Activities
  # TODO: Document
  class CreateTrelloCardHandler
    def configure(fr8_json:, fr8_data:)
      # grab controls crate from data
      controls_crate =
        fr8_data.activity_dto.crate_storage.first_crate_of_type(
          Fr8::Manifests::ManifestType::STANDARD_CONFIGURATION_CONTROLS
        )

      unless controls_crate.nil?
        # TODO: handle subsequent configuration
      end

      # add controls on initial call
      fr8_data.activity_dto.crate_storage.crates << Fr8::Data::CrateDTO.new(
        manifest_id:
          Fr8::Manifests::ManifestType::STANDARD_CONFIGURATION_CONTROLS[:id],
        manifest_type:
          Fr8::Manifests::ManifestType::STANDARD_CONFIGURATION_CONTROLS[:type],
        contents: Fr8::Manifests::StandardConfigurationControlsCM.new(
          controls: [
            Fr8::Controls::TextSource.new(
              name: 'name',
              label: 'Name',
              initial_label: 'Name',
              required: true,
              message_source: Fr8::Controls::ControlSource.new(
                manifest_type:
                  Fr8::Manifests::ManifestType::FIELD_DESCRIPTION[:type],
                request_upstream: true
              )
            ),
            Fr8::Controls::TextSource.new(
              name: 'description',
              label: 'Description',
              initial_label: 'Description',
              message_source: Fr8::Controls::ControlSource.new(
                manifest_type:
                  Fr8::Manifests::ManifestType::FIELD_DESCRIPTION[:type],
                request_upstream: true
              )
            )
          ]
        )
      )

      fr8_data.activity_dto
    end

    def authentication_token(fr8_json:, fr8_data:)
      external_token_dto = ExternalAuthenticationDTO.from_fr8_json(fr8_json)
      # extract token

      oauth_verifier = external_token_dto.parameters[:oauth_verifier]
      oauth_token = external_token_dto.parameters[:oauth_token]
    end
  end
end
