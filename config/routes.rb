Rails.application.routes.draw do
  scope module: :web do
    root to: 'home#index'

    resource :sessions, only: [:new, :create, :destroy]
    resource :registrations, only: [:new, :create]
    resources :teams, only: [:index, :show]

    namespace :account do
      resources :teams, only: [:index, :new, :create]
    end
  end
end
