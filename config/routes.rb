Rails.application.routes.draw do
  resources :user_conversations
  resources :messages
  get 'user/username'
  get 'user/password_digest'
  get 'user/first_name'
  get 'user/last_name'
  get 'thread/title'
  get 'thread/description'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
