Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions
  resources :playlist
  resources :playlist_item
  resources :song
  resources :auto

  get :search, to: 'auto#search'
  get :song_search, to: 'song#song_search'
  post :switch, to: 'playlist#switch'


  root to: "landing#index"
  get :about, to: 'static_pages#about'
  get :contact, to: 'static_pages#contact'
  get :player, to: "player#index"
  get :select_playlist, to: "playlist#select_playlist"


  resources :users, only: [:new, :edit, :create, :update]
  resources :sessions, only: [:new, :create, :destroy]

  resources :chart, only: [:index]
  resources :spotify, only: [:index]
  get '/auth/spotify/callback', to: 'users#spotify'

  match 'auth/:provider/callback', to: 'omniauth#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'omniauth#destroy', as: 'signout', via: [:get, :post]

end
