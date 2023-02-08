Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount ActionCable.server => '/cable'
  
  # post "/login", to: "sessions#login"
  # post"/signup", to: "sessions#signup"
  root to: 'users#index'
  get '/users', to: 'users#index'
  get '/me', to: 'users#me'
  post '/login', to: 'users#login'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show'

  get '/parkings', to: 'parkings#index'
  get 'parkings/:id', to: 'parkings#show'
  post '/parkings', to: 'parkings#create'
  patch '/parkings/:id', to: 'parkings#update'
  put 'parkings/:id', to: 'parkings#update_buyer'
end
