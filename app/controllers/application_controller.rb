# require 'bcrypt'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :logged_in?, :current_user
  
  private
  
  def sign_in(user)
    @user = User.find_by_credentials(user.email, user.password)
    if @user
      session[:session_token] = @user.session_token
    else
      nil
    end

  end
  
  def sign_out
    session[:token] = nil
    current_user.reset_token!
  end
  
  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end
  
  def sign_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
