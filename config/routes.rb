Rails.application.routes.draw do
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
  end
  resources :users, only: [:show, :edit, :update]

end
