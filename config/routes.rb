Rails.application.routes.draw do
  root to: 'client/home#index'

  get 'sign_in' => 'user_sessions#new'
  post 'sign_in' => 'user_sessions#create'
  delete 'sign_out' => 'user_sessions#destroy'

  get 'sign_up' => 'users#new'
  post 'sign_up' => 'users#create'


  resources :requests, controller: 'client/requests'

  namespace :admin do
    get '/' => 'home#index'
  end

end
