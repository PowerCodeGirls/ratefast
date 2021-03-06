Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'dashboard#index'

  namespace :admin do
    resources :votings
    resources :results, only: [:show, :update, :create, :destroy]

    get '', to: 'votings#index', as: 'dashboard'
  end

  resources :votings, only: [:index, :show, :update]
  resources :items, only: :update

  get '/how_it_works', to: 'pages#how_it_works'
end
