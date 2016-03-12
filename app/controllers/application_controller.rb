class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    User.find(cookies[:user_id])
  end

  def set_cookie
    if cookies[:user_id].blank?
      user = User.create
      cookies.permanent[:user_id] = user.id
    end
  end
end
