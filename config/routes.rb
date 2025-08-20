# config/routes.rb
Rails.application.routes.draw do
  # Devise auth
  devise_for :users

  # Home
  root to: "pages#home"

  # Health check (optional)
  get "up" => "rails/health#show", as: :rails_health_check

  # Perfumes: index/show/new/create/destroy
  resources :perfumes, only: [:index, :show, :new, :create, :destroy] do
    # Start a chat tied to a specific perfume (POST /perfumes/:perfume_id/chats)
    resources :chats, only: [:create]
  end

  # Chats: list and show past conversations
  resources :chats, only: [:index, :show] do
    # Messages within a chat
    # GET  /chats/:chat_id/messages  -> messages#index (messages in that chat)
    # POST /chats/:chat_id/messages  -> messages#create
    resources :messages, only: [:index, :create]
  end

  # Global Messages inbox for navbar
  # GET /messages -> messages#index (aggregated for current_user)
  resources :messages, only: [:index]
end
