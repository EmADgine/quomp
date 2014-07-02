Rails.application.routes.draw do
    #devise_for :users, :controllers => {:registrations => "registrations"}

    #devise_for :users, :controllers => {:sessions => "sessions"}, :skip=> :registrations
    #devise_for :clients, :providers, :skip=> :sessions
    #resources :clients
    #resources :providers
    #resources :users
    root :to=>'pages#home'
    match '/home', to: 'pages#home', via: 'get'

    



    devise_for :users, :controllers =>{:registrations=>"registrations",:sessions => "sessions"},:skip =>[:registrations] do
        delete '/logout', :to => 'sessions#destroy', :as => :destroy_user_session
        get '/login', :to => 'sessions#new', :as=> :new_user_session
        post '/login', :to => 'sessions#create', :as=> :user_session
    end
    devise_for :providers, :controllers=>{:registrations=>"registrations"},:skip => [:sessions,:passwords]
    devise_for :clients, :controllers=> {:registrations=> "registrations"},:skip => [:sessions,:passwords]
    
    resources :clients
    resources :providers

end
