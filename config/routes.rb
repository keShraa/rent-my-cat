Rails.application.routes.draw do
  get 'messages/create'
  get 'chatrooms/show'
  devise_for :users

  root to: 'pages#home'

  resources :bookings, only: [:index, :show, :destroy, :edit, :update] do
    member do
      patch 'accept'
      patch 'refuse'
    end
  end

  resources :cats do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: :create
  end
  resources :users, only: [:show, :edit, :update]

  resources :chat_rooms, only: [ :show, :create ] do
    resources :messages, only: [ :create ]
  end

end
