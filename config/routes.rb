Rails.application.routes.draw do
    get "pages/home"
    get "pages/cpp"
    get "pages/ppp"
    get "pages/ccp"
    get "pages/pcp"
    get "pages/jsf"
    get "pages/trts"
    get "pages/stp"
    get "pages/pjap"
    get "pages/erp"
    get "pages/spip"
    get "pages/cp"
    match '/home', to: 'pages#home', via: 'get'
end
