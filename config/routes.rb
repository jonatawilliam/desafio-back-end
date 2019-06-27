Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "authentications" }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'sign_out' => 'devise/sessions#destroy'
  end
end
