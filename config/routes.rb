Rails.application.routes.draw do
  get 'login', to: 'login#main'
  get 'payees', to: 'payees#main'
end
