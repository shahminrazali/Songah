Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :sessions
  resources :playlist
  resources :playlist_item
  resources :song
  get :song_search, to: 'song#song_search'


  root to: "landing#index"
  get :about, to: 'static_pages#about'
  get :contact, to: 'static_pages#contact'
  get :service, to: 'static_pages#service'
  get :work, to: 'static_pages#work'
  get :work_details, to: 'static_pages#work_details'
  resources :users, only: [:new, :edit, :create, :update]

  resources :chart, only: [:index]
  resources :spotify, only: [:index]
  get '/auth/spotify/callback', to: 'users#spotify'

  match 'auth/:provider/callback', to: 'omniauth#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'omniauth#destroy', as: 'signout', via: [:get, :post]
end
