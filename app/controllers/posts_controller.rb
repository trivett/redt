class PostsController < ApplicationController

  def index
    @posts = Post.all

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.votes = 1
    if @post.save
      redirect_to posts_path
    else
      render "new"
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote
    @post.save
    redirect_to posts_path
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote
    @post.save
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:link_url)
  end


end
