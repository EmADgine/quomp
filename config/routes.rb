Rails.application.routes.draw do
    resources :users
    resources :providers
    resources :sessions, only: [:new, :create, :destroy]
    root 'pages#home'
    match '/home', to: 'pages#home', via: 'get'
    match '/signup', to: 'users#new', via: 'get'
    match '/signin', to: 'sessions#new', via: 'get'
    match '/signout', to: 'sessions#destroy', via: 'get'
end
