Rails.application.routes.draw do
  # Devise
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get      'login'                  => 'devise/sessions#new'
    post     'login'                  => 'devise/sessions#create'
    get      '/users/sign_out'        => 'devise/sessions#destroy'
    root to: 'static_pages#dashboard'
  end

  resources :people,
            :households,
            :items
  get 'inventory' => 'items#index'
  get 'customers' => 'people#index'

  resources :store_transactions do
    resources :store_transaction_line_items
  end

  resources :intake, only: %i[new create]
  get 'intake', to: 'intake#new', as: :intake

  # Static pages
  get 'dashboard' => 'static_pages#dashboard'
  get 'charts'    => 'static_pages#dashboard'
end
