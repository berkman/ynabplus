class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  protected

  def current_google_user
    @current_google_user ||= User.find(session[:google_user_id]) if session[:google_user_id]
  end

  def google_signed_in?
    !!current_google_user
  end

  #def current_user=(user)
  #  session[:user_id] = user&.id
  #  @current_user = user
  #end
end
