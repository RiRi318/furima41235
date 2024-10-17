Rails.application.routes.draw do
  get 'items/index'
  get 'furima/index'
  root to: 'items#index'
end
