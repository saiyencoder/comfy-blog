class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = "Post successfully created"
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:success] = "Post successfully updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:danger] = "Post has been deleted"
    redirect_to posts_path
  end

  def my_posts
    @posts = Post.where(user_id: current_user.id ).order("created_at DESC")
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def verify_user
    @user = current_user.posts.find_by(id: params[:id])
    if @user.nil?
      flash[:danger] = "Not Authorized to Access Page" 
      redirect_to posts_path
    end
  end

end
