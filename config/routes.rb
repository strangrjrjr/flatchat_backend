Rails.application.routes.draw do
  resources :user_conversations
  resources :messages
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/home', to: 'conversations#index'
  get '/current_user', to: 'auth#show'
  resources :conversations
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
