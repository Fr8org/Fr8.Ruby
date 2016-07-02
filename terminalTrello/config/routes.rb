Rails.application.routes.draw do
  get 'terminal/index'

  root 'terminal#index'
end
