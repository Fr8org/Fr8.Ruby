# frozen_string_literal: true
# TODO: Describe this controller
class TerminalController < ApplicationController
  def index
  end

  def discover
    web_service = ::Fr8::Data::WebServiceDTO.new(
      name: 'Trello',
      icon_path: view_context.image_path('trello-64x64.png')
    )
    terminal = ::Fr8::Data::TerminalDTO.new(
      id: '77c60be2-2fb7-43ee-87b8-8bdd0c5136b5',
      name: 'terminalTrello',
      version: '1',
      endpoint: 'http://terminaltrello.herokuapp.com:80',
      label: 'Trello Terminal',
      authentication_type: ::Fr8::Data::AuthenticationType::NONE
    )
    create_trello_card = ::Fr8::Data::ActivityTemplateDTO.new(
      id: '57603b35-559b-417a-9310-ff00fca680af',
      name: 'create_trello_card',
      version: '1',
      terminal: terminal,
      web_service: web_service,
      activity_category: ::Fr8::Data::ActivityCategory::FORWARDERS,
      needs_authentication: false,
      label: 'Create Trello Card'
    )
    create_trello_card_handler = ::Activities::CreateTrelloCardHandler.new
    handler = ::Fr8::Terminal::TerminalHandler.new(
      terminal: terminal,
      activities: [
        [create_trello_card, create_trello_card_handler]
      ]
    )

    render json: handler.discover
  end
end
