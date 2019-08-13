Rails.application.routes.draw do
  resources :bookings, only: [:index, :create]
  resources :users do
    resources :cats, only: [:index, :show]
  end



  resources :cats

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
