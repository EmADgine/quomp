Rails.application.routes.draw do
    root :to=>'pages#home'
    match '/home', to: 'pages#home', via: 'get'
    match '/congratulations', to: 'pages#select_splash', via: 'get'
    



    devise_for :users, :controllers =>{:registrations=>"registrations",:sessions => "sessions", :passwords => "passwords"},:skip =>[:registrations] do
        get '/users/sign_out' => 'sessions#destroy', :as=>:destroy_user_session
        delete '/logout', :to => 'sessions#destroy', :as => :destroy_user_session
        get '/login', :to => 'sessions#new', :as=> :new_user_session
        post '/login', :to => 'sessions#create', :as=> :user_session
    end
    devise_for :providers, :controllers=>{:registrations=>"registrations", :passwords => "passwords"},:skip => [:sessions,:passwords]
    devise_for :clients, :controllers=> {:registrations=> "registrations", :passwords => "passwords"},:skip => [:sessions,:passwords] do
        get 'clients', :to => 'clients#show', :as=> :client_root
    end
    
    resources :clients do
        resources :jobs do
            member do
                get :select_provider
                get '/save/provider', controller: "jobs", action: "save_provider"
            end
        end
    end
    resources :providers
end
