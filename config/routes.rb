Rails.application.routes.draw do
  scope module: :web do
    root to: 'home#index'

    resource :sessions, only: [:new, :create, :destroy]
    resource :registrations, only: [:new, :create]
    resources :teams, only: [:index, :show] do
      scope module: :teams do
        resources :channels, only: [:index, :show, :new, :create]
      end
    end

    resources :channels, only: [] do
      scope module: :channels do
        resources :messages, only: [:create, :update, :destroy]
        resource :join, only: [:create]
      end
    end

    namespace :account do
      resources :teams, only: [:index, :new, :create]
    end
  end
end
