module SessionsHelper
    
      
  def log_in(user)
    @current_user = session[:user_id] = user.id
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by(id: user_id)
    else
      return nil
    end
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def sign_out
    session.delete(:user_id)
    cookies.delete(:remember_token)
    cookies.delete(:user_id)
    @current_user = nil
  end
  
  def logged_in?
    !current_user.nil?
  end
end
