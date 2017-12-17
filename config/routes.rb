Rails.application.routes.draw do
  root "home#index"

  resource :wechat, only: %i( show create )
  namespace :wechat do
    resources :stores, only: %i( index show )
    resource :cart, only: %i( show destroy ) do
      collection do
        post :add, path: 'add/:id'
        delete :minus, path: 'minus/:id'
      end
    end

    resources :orders, only: %i( index show create destroy )
    resource :payment, only: %i( show create ) do
      get :done
      post :notify
    end
  end
  get 'auth/wechat/callback', to: 'home#wechat'

  devise_for :users, :controllers => {
      :omniauth_callbacks => "users/omniauth_callbacks",
  }

  resources :users, except: %i( new create ) do
    member do
      patch :rolify
    end
  end
  resources :menus do
    member do
      get 'pictures', to: 'menus#list'
      post 'pictures', to: 'menus#upload'
      delete 'pictures/:picture_id', to: 'menus#remove'
    end
  end
  resources :stores
  resources :orders do
    member do
      post :confirm
    end
  end

  require 'sidekiq/web'
  authenticate :user, lambda {|u| u.admin?} do
    mount Sidekiq::Web => '/sidekiq'
  end

end
