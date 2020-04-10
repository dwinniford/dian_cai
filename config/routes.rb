Rails.application.routes.draw do
  
  
 
  resources :users, only: [:new, :create, :show] do 
    resources :translations, :orders, :restaurants, :comments, only: [:index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/facebook/callback', to: 'sessions#facebook'
  delete '/sessions', to: 'sessions#destroy'

  resources :restaurants do 
    resources :translations, only: [:new, :create, :index]
    resources :orders, only: [:new, :create, :index]
    resources :dishes, only: [:index]
  end

  resources :translations, only: [:show, :edit, :update, :destroy] do 
    resources :dishes, only: [:new, :create]
    resources :comments, only: [:new, :create, :index]
  end

  resources :orders, only: [:show, :edit, :update, :destroy]
  resources :dishes, only: [:show, :edit, :update, :destroy] do 
    resources :dish_orders, only: [:create]
  end
  resources :dish_orders, only: [:destroy]
  resources :comments, only: [:show, :edit, :update, :destroy]
   
  
  root 'application#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
