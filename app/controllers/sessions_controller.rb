class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Logged In!"
      redirect_to root_path
    else
      flash.now[:danger] = "Incorrect email/password!"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    sign_out
    flash[:notice] = "Logged out!"
    redirect_to root_path
  end

end
