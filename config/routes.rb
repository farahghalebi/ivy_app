Rails.application.routes.draw do
  devise_for :users

  # Home
  root to: "pages#home"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Perfumes: index/show/new/create/destroy
  resources :perfumes, only: [:index, :show, :new, :create, :destroy] do
    # Start a chat for a specific perfume
    resources :chats, only: [:new, :create, :show]
  end

  # Chats: list and show past conversations
  resources :chats, only: [:index] do
    # Messages: create within a chat
    resources :messages, only: [:create]
  end
end
