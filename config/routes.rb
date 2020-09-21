Rails.application.routes.draw do
  resources :groups
  resources :expenses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Custom endpoints for the app
  post '/access', to: 'access_control#signin'
  delete '/access', to: 'access_control#logout'

  get '/mytransactions', to: 'expenses#index'
  # get '/myexternal', to: 'expenses#my_external'
  # get '/mygroups', to: 'groups#my_groups'

  # Custom root page for the application
  root 'users#index'
end
