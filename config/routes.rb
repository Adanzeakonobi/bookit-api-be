Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  resources :vehicles, only: [:index, :show, :create, :update]
  resources :reservations, only: [:index, :create]
  get 'uploadcare/auth_params'
  get '/', to: 'swag#api'
  root to: 'swag#api'
end
