class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:edit, :update, :destroy, :my_posts]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post - Post.new(post_params)

    if @post
      flash[:notice] = "Post successfully created"
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:notice] = "Post successfully updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    flash[:notice] = "Post has been deleted"
    redirect_to posts_path
  end

  def my_posts
    @posts = Post.where(user_id: current_user.id )
  end

  private

  def set_post
    @post = Post.find(params[:id]).order("created_at DESC")
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def verify_user
    @user = current_user.posts.find_by(id: params[:id])
    redirect_to posts_path, flash[:notice] = "Not Authorized to Access Page" if @user.nil?
  end

end
