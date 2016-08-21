# frozen_string_literal: true
# TODO: Describe this controller
class TerminalController < ApplicationController
  protect_from_forgery(
    with: :null_session,
    if: proc { |c| c.request.format == 'application/json' }
  )

  def index
  end

  def activate
    ''
  end

  def deactivate
    ''
  end

  def discover
    handler = get_vars
    render json: handler.discover
  end

  def configure
    handler = get_vars
    render json: handler.configure(params)
  end

  def request_url
    handler = get_vars
    render json: handler.request_url(request)
  end

  def token
    handler = get_vars
    render json: handler.token(params, request)
  end

  private

  def get_vars
    web_service = Fr8::Data::WebServiceDTO.new(
      name: 'Trello',
      icon_path: view_context.image_url('trello-64x64.png')
    )
    terminal = Fr8::Data::TerminalDTO.new(
      id: '77c60be2-2fb7-43ee-87b8-8bdd0c5136b5',
      name: 'terminalTrello',
      version: '1',
      endpoint: "#{request.protocol}#{request.host_with_port}",
      label: 'Trello Terminal',
      authentication_type: Fr8::Data::AuthenticationType::EXTERNAL
    )
    create_trello_card = Fr8::Data::ActivityTemplateDTO.new(
      id: '57603b35-559b-417a-9310-ff00fca680af',
      name: 'create_trello_card_secure',
      version: '1',
      terminal: terminal,
      web_service: web_service,
      activity_category: Fr8::Data::ActivityCategory::SHIP_DATA,
      categories: [
        Fr8::Data::ACTIVITY_CATEGORIES[:SHIP_DATA],
        Fr8::Data::ActivityCategoryDTO.new(
          name: web_service.name,
          icon_path: web_service.icon_path
        )
      ],
      needs_authentication: true,
      label: 'Create Trello Card'
    )
    create_trello_card_handler = Activities::CreateTrelloCardHandler.new
    handler = Fr8::Terminal::TerminalHandler.new(
      terminal: terminal,
      activities: [
        [create_trello_card, create_trello_card_handler]
      ]
    )

    handler
  end
end
