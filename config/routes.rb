Rails.application.routes.draw do
  root 'categories#index'

  resources :listings
  resources :categories
end
