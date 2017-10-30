class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
  end

  def update
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Members Only! Feel free to make a post!"
      log_in @user
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
