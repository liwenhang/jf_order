Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  resources :users, except: [:new, :create]
  resources :menus
  resources :stores

  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resource :wechat, only: [:show, :create]
  scope 'wx' do
    # todo
  end

end
