Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  resources :users

  resources :stores do
    resources :menus
  end
  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
