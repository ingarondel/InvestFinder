Rails.application.routes.draw do
   devise_for :users, controllers: {
     registrations: 'registrations/registrations'
   }
  resources :ideas do
    resources :responses, only: [:create, :destroy]
  end
  resources :users

  root to: 'ideas#index'
end
