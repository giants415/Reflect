Rails.application.routes.draw do
  root to: "users#new"


  resources :users
  resources :posts

  get "/login", to: "sessions#new", as: 'new_session'
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: 'logout'

  get '/signup', to: "users#new"
  post '/users', to: 'users#create'

  get '/cloud', to: "cloud#index", as: "cloud"
end
