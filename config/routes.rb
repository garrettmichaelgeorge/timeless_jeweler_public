Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get       'login'         => 'devise/sessions#new'
    post      'login'         => 'devise/sessions#create'
    get       '/users/sign_out' => 'devise/sessions#destroy'
    root to:  'static_pages#dashboard'
  end

  # root to:      'devise/sessions#new'
  resources :people
  resources :households
  resources :products
  resources :parties

  resources :store_transactions do
    resources :store_transaction_line_items
  end

  get       'transactions'  => 'store_transactions#index'
  get       'customers'     => 'people#index'
  get       'dashboard'     => 'static_pages#dashboard'
  get       'charts'        => 'static_pages#dashboard'
end
