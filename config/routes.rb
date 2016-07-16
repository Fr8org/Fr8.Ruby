Rails.application.routes.draw do
  get 'terminal/index'

  get '/discover', to: 'terminal#discover'

  post '/activities/configure', to: 'terminal#configure'

  root 'terminal#index'
end
