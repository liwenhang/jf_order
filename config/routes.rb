Rails.application.routes.draw do
  root "home#index"

  resource :wechat, only: [:show, :create]
  namespace :wechat do
    resources :stores, only: [:index, :show]
    resource :cart, only: [:show] do
      collection do
        post :add, path: 'add/:id'
        post :plus, path: 'plus/:id'
        delete :minus, path: 'minus/:id'
      end
    end
  end

  get 'auth/wechat/callback', to: 'home#wechat'


  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
  }

  resources :users, except: [:new, :create]
  resources :menus
  resources :stores

  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
