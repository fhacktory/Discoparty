Rails.application.routes.draw do
  resources :playlists, only: [:create, :show] do
    member do
      resources :tracks, only: :create
    end
  end

  root to: 'home#index'
end
