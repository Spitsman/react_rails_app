Rails.application.routes.draw do
  root to: 'matches#index'

  resources :matches

  resources :teams do
    member do
      get 'toggle_favorite', action: 'toggle_favorite'
    end
  end

end
