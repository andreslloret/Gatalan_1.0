Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :tours do
  resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :edit, :update] do
  member do
  patch :accept
  patch :decline
  end
  end

  resources :users, only: [:show] do
  resources :bookings, only: [:index]
  end

  delete 'bookings/:id', to: 'bookings#destroy', as: 'destroy_booking'

  get 'dashboard', to: 'bookings#dashboard'
  end
