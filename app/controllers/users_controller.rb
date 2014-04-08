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

    def update
    # @ = Song.find(params[:id])
    # @song.update(song_params)
    # @song.price = params[:song][:price]
    # @song.save
    # redirect_to song_path(@song)

  end



  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
