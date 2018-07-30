Rails.application.routes.draw do
  post 'assistant', to: 'assistant#main'
  get 'months', to: 'months#main'
  get 'accounts', to: 'accounts#main'
  get 'categories', to: 'categories#main'
  get 'budgets', to: 'budgets#main'
  get 'login', to: 'login#main'
  get 'payees', to: 'payees#main'
  root to: 'login#main'
end
