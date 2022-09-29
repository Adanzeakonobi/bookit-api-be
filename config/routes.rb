Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }, defaults: { format: :json }
  resources :vehicles, only: [:index, :show, :create, :update], defaults: { format: :json }
  resources :reservations, only: [:index, :create], defaults: { format: :json }
  get 'uploadcare/auth_params'
  get '/', to: 'swag#api'
  root to: 'swag#api'
end
