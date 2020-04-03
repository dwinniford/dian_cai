Rails.application.routes.draw do
  
  
  resources :restaurants do 
    resources :translations, only: [:new, :create]
  end

  resources :translations, only: [:show, :edit, :update, :destroy] do 
    resources :dishes, only: [:new, :create]
  end

  resources :dishes, only: [:show, :edit, :update, :destroy]
  
  root 'application#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
