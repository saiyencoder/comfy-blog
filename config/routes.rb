Rails.application.routes.draw do
  comfy_route :cms_admin, path: "/admin"
  # Ensure that this route is defined last
  comfy_route :cms, path: "/"
  devise_for :users
  resources :posts do
    # Comments is a nested route to Posts
    resources :comments
  end
  root to: 'posts#index'
  get '/my_posts', to: 'posts#my_posts'
end
