class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

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

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
