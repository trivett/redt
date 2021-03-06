class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = Post.where(:user_id => @user.id)
  end


  def new
    unless current_user
      @user = User.new
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end

  def index
    @users = User.all
    #@posts = Post.all


  end



  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
