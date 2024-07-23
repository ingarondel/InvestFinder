Rails.application.routes.draw do
   devise_for :users, controllers: {
     registrations: 'registrations/registrations'
   }
  resources :ideas do
    resources :responses, only: [:create, :destroy]
  end
  resources :users do
    resources :contacts, only: [:new, :create, :edit, :update, :destroy]
  end

  root to: 'ideas#index'
end
