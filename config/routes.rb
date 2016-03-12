Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :search, only: :show
    end
  end

  resources :playlists, only: [:create, :show] do
    member do
      resources :tracks, only: :create
    end
  end

  get '/styleguide', to: 'home#styleguide'

  root to: 'home#index'
end
