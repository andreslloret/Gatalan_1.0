Rails.application.routes.draw do
  devise_for :users

  root to: 'tours#index'

  resources :tours do
    post 'create_booking', on: :member
  end
end
