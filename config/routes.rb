Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
    root to: 'pages#index'
    resources :users
    
    get 'home/profile'
    
    get 'auth/:provider/callback', to: "sessions#create"
    
    delete 'sign_out', to: "sessions#destroy", as: "sign_out"
    
end
