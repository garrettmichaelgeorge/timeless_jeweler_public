Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get      'login'                  => 'devise/sessions#new'
    post     'login'                  => 'devise/sessions#create'
    get      '/users/sign_out'        => 'devise/sessions#destroy'
    root to: 'static_pages#dashboard'
  end

  resources :people,
            :households,
            :items

  resources :store_transactions do
    resources :store_transaction_line_items
  end

  resources :intake, only: %i[new create]

  get 'inventory' => 'items#index'
  get 'customers' => 'people#index'
  get 'dashboard' => 'static_pages#dashboard'
  get 'charts'    => 'static_pages#dashboard'
  get 'intake', to: 'intake#new', as: :intake
end
