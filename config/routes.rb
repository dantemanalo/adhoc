Rails.application.routes.draw do
  resources :transmittal_lists
  resources :prod_accounting_entries

  match 'search', to: 'prod_accounting_entries#index', via: :get
  match 'trans_search', to: 'transmittal_lists#index', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
