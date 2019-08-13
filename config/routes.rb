Rails.application.routes.draw do
  resources :bookings, only: [:index, :create]
  resources :user do
    resources :cats, only: [:index]
  end

  resources :cats

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
