Rails.application.routes.draw do
  root to: 'client/home#index'

  get 'sign_in' => 'user_sessions#new'
  post 'sign_in' => 'user_sessions#create'
  delete 'sign_out' => 'user_sessions#destroy'

  get 'sign_up' => 'users#new'
  post 'sign_up' => 'users#create'

  get 'confirm_email/:token' => 'users#confirm_email', as: 'confirm_email'

  resources :requests, controller: 'client/requests', except: [:index, :show] do
    resource :answer, controller: 'client/requests/answers'
  end

  namespace :admin do
    get '/' => 'home#index'

    resources :requests, only: [:edit, :update, :destroy] do
      resource :answer, controller: 'requests/answers'
      resources :histories, only: [:index], controller: 'requests/histories'
    end

    resources :users
  end

end
