Rails.application.routes.draw do
  resources :users
  root 'application#index'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
