Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount ActionCable.server => '/cable'
  
  post "/login", to: "sessions#login"
  post"/signup", to: "sessions#signup"

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  delete '/users/:id', to: 'users#destroy'

  get '/parkings', to: 'parkings#index'
  get 'parkings/:id', to: 'parkings#show'
  post '/parkings', to: 'parkings#create'
  patch '/parkings/:id', to: 'parkings#update'
  put 'parkings/:id', to: 'parkings#update_buyer'
end
