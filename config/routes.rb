Rails.application.routes.draw do
    devise_for :providers
    devise_for :users, :controllers => {:registrations => "registrations"}
    resources :users
    resources :providers
    root :to=>'pages#home'
    match '/home', to: 'pages#home', via: 'get'
end
