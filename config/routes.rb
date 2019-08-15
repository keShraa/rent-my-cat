Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :bookings, only: [:index, :show, :destroy, :edit, :update]
  resources :cats do
    resources :bookings, only: [:new, :create] do
      member do
        get 'payment'
      end
    end
  end
  resources :users, only: [:show, :edit, :update]

end
