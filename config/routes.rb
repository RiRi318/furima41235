Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get 'furima/index'
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
  end

end
