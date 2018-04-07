Rails.application.routes.draw do
  root 'home#index'

  # home
  get 'home/index'

  # users
  devise_for :users

  # artists
  resources :artists, only: [:index, :show, :create, :destroy]

  # discogs
  get 'discogs/search' => 'discogs#search'
end
