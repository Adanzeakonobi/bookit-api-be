Rails.application.routes.draw do
  devise_for :users, controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  resources :vehicles, only: [:index, :show, :create, :update]
  resources :reservations, only: [:index, :create]
end
