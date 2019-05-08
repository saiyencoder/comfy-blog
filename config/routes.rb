Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    # Comments is a nested route to Posts
    resources :comments
  end
  root to: 'posts#index'
  get '/my_posts', to: 'posts#my_posts'
end
