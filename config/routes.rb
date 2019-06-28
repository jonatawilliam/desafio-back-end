require 'sidekiq/web'

Rails.application.routes.draw do
  root "type_transactions#index"
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, controllers: { omniauth_callbacks: "authentications" }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'sign_out' => 'devise/sessions#destroy'
  end
  resources :cnba_upload_files, only: %i[create new]
  resources :type_transactions, only: %i[index]
end
