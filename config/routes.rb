Rails.application.routes.draw do
   devise_for :users, controllers: {
     registrations: 'registrations/registrations'
   }
  resources :ideas do
    resources :reactions, only: %i[create destroy update]
    resources :responses, only: [:create, :destroy]
    resources :comments, shallow: true do
      resources :reactions, only: %i[create destroy update]
    end
  end
  resources :users do
    resources :contacts, only: [:new, :create, :edit, :update, :destroy]
  end

  root to: 'ideas#index'
end
