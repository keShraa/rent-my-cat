Rails.application.routes.draw do
<<<<<<< HEAD
  resources :cats, only: [:index]


=======
  devise_for :users
>>>>>>> 77de55cd89576262d32a9f15c8f67f7a940619f0
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
