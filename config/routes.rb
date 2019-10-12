Rails.application.routes.draw do
  scope module: :web do
    root to: 'home#index'
  end
end
