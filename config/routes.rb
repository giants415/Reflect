Rails.application.routes.draw do
  root to: "users#new"


  resources :users do
    resources :posts
  end

  get "/login", to: "sessions#new", as: 'new_session'
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: 'logout'

  get '/signup', to: "users#new"
  post '/users', to: 'users#create'

  get 'users/:user_id/posts/:post_id/cloud', to: "cloud#index", as: "cloud"
end
