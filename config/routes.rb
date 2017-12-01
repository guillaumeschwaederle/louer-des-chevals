Rails.application.routes.draw do

  resources :profiles, only: [:new, :create, :edit, :update, :show] do
    resources :monecurie, controller: 'profileschevals', only: [:index]
    resources :mesreservations, controller: 'profilesbookings', only: [:index]
    resources :mesclients, controller: 'profiles_reservations_clients', only: [:index]
  end

  get 'validate', to: 'bookings#validate', as: 'validate'
  get 'refuse', to: 'bookings#refuse', as: 'refuse'
  get 'cancel', to: 'bookings#cancel', as: 'cancel'

  resources :chevals do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :bookings, only: [:show, :create, :edit, :update, :destroy]
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
