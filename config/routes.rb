Rails.application.routes.draw do
   devise_for :users, controllers: {
     registrations: 'registrations/registrations'
   }
  resources :ideas

  root to: 'ideas#index'
end
