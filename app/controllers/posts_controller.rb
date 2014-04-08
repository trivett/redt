class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @user.save
      redirect_to posts_path
    else
      render "new"
    end
  end



  private
  def post_params
    params.require(:user).permit(:link_url)
  end


end
