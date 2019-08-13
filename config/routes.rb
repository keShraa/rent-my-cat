Rails.application.routes.draw do
  resources :bookings, only: [:index, :show]
  resources :cats do
    resources :bookings, only: [:new, :create]
  end
  resources :users, only: [:show, :edit]

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
