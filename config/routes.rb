Rails.application.routes.draw do
  scope module: :web do
    root to: 'home#index'

    resource :sessions, only: [:new, :create, :destroy]
    resource :registrations, only: [:new, :create]
  end
end
