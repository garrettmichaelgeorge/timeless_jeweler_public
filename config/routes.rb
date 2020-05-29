Rails.application.routes.draw do
  get 'people/resources'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root      'sessions#new'
  resources :people
  resources :households
  resources :products
  resources :parties

  resources :store_transactions do
    resources :store_transaction_line_items
  end

  get       'customers'     => 'people#index'
  
  # get       'parties/:actable_type' => 'parties#index'
  # get       'households'    => redirect('/parties?actable_type=household')
  
  get       'dashboard'     => 'static_pages#dashboard'

  # Login and Logout
  get       'login'         => 'sessions#new'
  post      'login'         => 'sessions#create'
  delete    'logout'        => 'sessions#destroy'
end
