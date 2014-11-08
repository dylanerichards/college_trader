Rails.application.routes.draw do
  root 'categories#index'

  resources :categories do
    resources :listings
  end
end
