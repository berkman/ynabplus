Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :accounts#, only: [:index, :show]
  resources :budgets
  resources :categories
  resources :months
  resources :payees
  resources :home, only: [:index]
  resources :sessions, only: [:create, :destroy]

  root to: "home#index"
end
