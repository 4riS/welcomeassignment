Rails.application.routes.draw do
  resources :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  
  get "hashtags" => "hashtag#hashtags"
  get "hashtag/:name" => "hashtag#hashtagposts", :as => 'hashtag_post'
  get "users" => "user#users"
  get "/user/:id" => "user#userposts", :as => 'user_post'
  get "/auth/facebook/callback" => "sessions#create"
  delete "/signout" => "sessions#destroy", :as => :signout
end
