Rails.application.routes.draw do
  scope module: :web do
    root to: 'home#index'

    resources :sessions, only: [:new, :create]
    resources :registrations, only: [:new, :create]
  end
end
