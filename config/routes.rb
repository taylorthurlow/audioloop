Rails.application.routes.draw do
  root 'home#index'

  # home
  get 'home/index'

  # users
  devise_for :users
end
