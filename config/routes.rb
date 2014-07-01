Rails.application.routes.draw do
  
  resources :links, except: [:index]

  resources :posts, only: [:show, :destroy, :edit] do
    resources :links, only: [:index]
  end

  resources :users do
    resources :circles, only: [:new, :create, :index, :show]
    resources :posts, only: [:new, :create, :index]
  end
  

  resources :circles, only: [:destroy, :edit, :update]
  resource :session
  
  resource :feed
  
end
