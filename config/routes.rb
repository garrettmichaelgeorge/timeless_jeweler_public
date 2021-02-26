Rails.application.routes.draw do
  devise_for :users, skip: [:sessions],
                     controllers: { sessions: 'users/sessions',
                                    # confirmations: 'users/confirmations',
                                    # passwords: 'users/passwords',
                                    # registrations: 'users/registrations'
                                    }

  devise_scope :user do
    get      'sign_in'  => 'devise/sessions#new',     as: :new_user_session
    post     'sign_in'  => 'devise/sessions#create',  as: :user_session
    delete   'sign_out' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  authenticated :user do
    root to: 'static_pages#dashboard', as: :authenticated_root
  end
  root to: redirect('/sign_in')

  resources :people,
            :households,
            :items

  resources :sales do
    resources :sale_line_items
  end

  get 'inventory' => 'items#index'
  get 'intake'    => 'items#new'
  get 'customers' => 'people#index'

  # Static pages
  get 'dashboard' => 'static_pages#dashboard'
  get 'charts'    => 'static_pages#dashboard'

  # Allow error pages to be handled by ErrorsController
  match '/404', to: 'errors#not_found',             via: :all
  match '/422', to: 'errors#unprocessable_entity',  via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
