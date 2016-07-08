Rails.application.routes.draw do
  get 'terminal/index'

  get '/discover', to: 'terminal#discover'

  root 'terminal#index'
end
