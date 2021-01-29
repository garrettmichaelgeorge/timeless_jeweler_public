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

  resources :sales do
    resources :sale_line_items
  end

  resources :intake, only: %i[new create]
  get 'intake', to: 'intake#new', as: :intake

  # Static pages
  get 'dashboard' => 'static_pages#dashboard'
  get 'charts'    => 'static_pages#dashboard'

  # Allow error pages to be handled by ErrorsController
  match '/404', to: 'errors#not_found',             via: :all
  match '/422', to: 'errors#unprocessable_entity',  via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
