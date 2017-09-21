Rails.application.routes.draw do
  resources :prod_accounting_entries

  match 'search', to: 'prod_accounting_entries#index', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
