Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'
  post 'assistant', to: 'assistant#main'

  get 'months', to: 'months#main'
  get 'accounts', to: 'accounts#main'
  get 'categories', to: 'categories#main'
  get 'budgets', to: 'budgets#main'
  get 'login', to: 'login#main'
  get 'payees', to: 'payees#main'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"
end
