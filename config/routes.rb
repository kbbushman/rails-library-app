Rails.application.routes.draw do

  root "users#index"

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  post '/sessions', to: 'sessions#create'

  resources :users

end
