Rails.application.routes.draw do
  get 'terminal/index'

  get '/discover', to: 'terminal#discover'

  post '/activities/configure', to: 'terminal#configure'

  post '/authentication/request_url', to: 'terminal#request_url'

  post '/authentication/token', to: 'terminal#token'

  root 'terminal#index'
end
