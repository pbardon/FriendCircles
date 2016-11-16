Rails.application.routes.draw do

  resources :posts, only: [:show, :destroy, :edit] do
    post 'posts/upvotes', to: "posts#upvote", as: :upvote
    post 'posts/downvotes', to: "posts#downvote", as: :downvote
  end

  resources :users, only: [:new, :create] do
    resources :circles, only: [:new, :create, :index, :show]
    resources :posts, only: [:new, :create, :index]
  end


  resources :circles, only: [:destroy, :edit, :update]
  resource :session, only: [:new, :destroy]

  resource :feed, only: [:show]

end
