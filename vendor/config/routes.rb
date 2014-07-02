Rails.application.routes.draw do
    devise_for :users, :controllers => {:registrations => "registrations"}
    #devise_for :users, :controllers => {:sessions => "sessions"}, :skip=> :registrations
    #devise_for :clients, :providers, :skip=> :sessions
    #resources :clients
    #resources :providers
    resources :users
    root :to=>'pages#home'
    match '/home', to: 'pages#home', via: 'get'
end
