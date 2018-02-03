Rails.application.routes.draw do
  root to: 'matches#index'

  post '/' => 'matches#create'

  resources :matches

  resources :teams do
    member do
      get 'toggle_favorite', action: 'toggle_favorite'
    end
  end

  get 'sign_in' => 'user_sessions#new'
  post 'sign_in' => 'user_sessions#create'
  delete 'sign_out' => 'user_sessions#destroy'

  get 'sign_up' => 'users#new'
  post 'sign_up' => 'users#create'

end
