Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  resources :users
  resources :menus
  resources :stores do
    resources :menus, only: [:new]
  end

  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
