Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  scope module: :web do
    root to: 'home#index'

    resource :sessions, only: [:new, :create, :destroy]
    resource :registrations, only: [:new, :create]
    resources :teams, only: [:index, :show] do
      scope module: :teams do
        resources :channels, only: [:index, :show, :new, :create]
        resource :join, only: [:create]
      end
    end

    resources :channels, only: [] do
      scope module: :channels do
        resource :join, only: [:create]
      end
    end

    namespace :account do
      resources :teams, only: [:index, :new, :create]
      resources :notifications
    end
  end

  scope module: :api do
    resources :channels, only: [] do
      scope module: :channels do
        resources :messages, only: [:create, :update, :destroy]
      end
    end
  end
end
