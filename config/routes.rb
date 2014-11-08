Rails.application.routes.draw do
  root 'categories#index'

  resources :categories do
    resources :listings do
      resources :comments
    end
  end
end
