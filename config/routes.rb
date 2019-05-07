Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root to: 'posts#index'
  get '/my_posts', to: 'posts#my_posts'
end
