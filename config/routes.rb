Rails.application.routes.draw do

  resources :profiles, only: [:new, :create, :edit, :update, :destroy, :show]

  resources :chevals do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :bookings, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
