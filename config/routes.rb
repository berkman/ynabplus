Rails.application.routes.draw do
  get 'accounts', to: 'accounts#main'
  get 'categories', to: 'categories#main'
  get 'budgets', to: 'budgets#main'
  get 'login', to: 'login#main'
  get 'payees', to: 'payees#main'
  root to: 'login#main'
end
