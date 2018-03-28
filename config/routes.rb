Rails.application.routes.draw do
  resources :users
  resources :books
  resources :sessions, only: [:facebook, :create, :destroy]
    

  get    'sessions/index'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  get    '/sell',    to:  'books#new'
  #post   '/signup',   to: 'sessions#create'
  post   '/login',   to: 'sessions#create'
  post   '/sell',    to: 'books#create'
  #delete '/logout',  to: 'sessions#destroy'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/:provider/callback', to: 'sessions#facebook'
  get 'auth/failure', to: redirect('/')

  post 'books/search' => 'books#search', as: 'search_books'
  
  root 'sessions#index'

end
