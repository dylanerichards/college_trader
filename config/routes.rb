Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'categories#index'

  resources :listings

  resources :categories do
    resources :listings do
      resources :comments
    end
  end
end
