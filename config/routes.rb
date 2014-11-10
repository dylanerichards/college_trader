Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'categories#index'

  resources :categories do
    resources :listings do
      resources :comments
    end
  end

  resources :listings do
    resources :comments
  end
end
