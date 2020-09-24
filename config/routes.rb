Rails.application.routes.draw do
  resources :groups
  resources :expenses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Custom endpoints for the app
  get '/expenses/new/:group', to: 'expenses#new'

  post '/access', to: 'access_control#signin'
  delete '/access', to: 'access_control#logout'

  get '/mytransactions', to: 'expenses#index'
  get '/myexternal', to: 'expenses#my_external'

  # Custom root page for the application
  root 'application#index'
end
