Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' } 
  namespace :api do
    namespace :v1 do
      resource :search, only: :show
      resources :playlists, only: :show do
        resources :tracks, only: :create
      end
    end
  end

  resources :playlists, only: [:create, :show]

  get '/styleguide', to: 'home#styleguide'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  root to: 'home#index'
end
