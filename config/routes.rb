Rails.application.routes.draw do
  get 'login', to: 'login#main'
  get '/auth/ynab/callback', to: 'login#callback'
  get 'payees', to: 'payees#main'
end
