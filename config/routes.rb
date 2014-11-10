Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'categories#index'

  resources :listings do
    resources :comments
  end

  resources :categories do
    resources :listings do
      resources :comments
    end
  end
end
