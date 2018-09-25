Rails.application.routes.draw do
  resources :top_producers

  resources :incurred_losses do
    get 'by_assured', on: :collection
  end

  resources :policy_taxes
  resources :policy

  get 'open_policies/index'
  get 'open_policies/show'
  get 'open_policies/home'

  get 'renewal_notice/single'
  get 'renewal_notice/perbranch'
  get 'renewal_notice/perintm'
  get 'renewal_notice/show'

  get 'policies/prod_acct_entry'
  get 'policies/show'
  get 'policies/negated'
  get 'policies/posted_docs_count'
  get 'policies/undistributed'
  get 'policies/non_marine_treaty'
  get 'policies/policy_count'
  get 'policies/surety_register'

  match 'top_search', to: 'top_producers#index', via: :get

  match 'search', to: 'policies#prod_acct_entry', via: :get
  match 'count', to: 'policies#policy_count', via: :get
  match 'search_undist', to: 'policies#undistributed', via: :get
  match 'search_reg', to: 'policies#surety_register', via: :get

  match 'trans_single', to: 'renewal_notice#single', via: :get
  match 'trans_branch', to: 'renewal_notice#perbranch', via: :get
  match 'trans_intm', to: 'renewal_notice#perintm', via: :get

  root "open_policies#home"
end
