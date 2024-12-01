Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :categories, only: %i[update index destroy create]
      resources :expenses, only: %i[update index destroy create]
      resources :payment_methods, only: %i[update index destroy create]
      resources :users, only: %i[update show destroy create]
      post 'login', to: 'sessions#create'
    end
  end
end
