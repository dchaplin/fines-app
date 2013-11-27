class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_current_user
  helper_method :current_user, :logged_in?, :is_admin?

protected
  def set_current_user
    @current_user = User.find_by_id(session[:user_id])
  end

  def current_user
    @current_user
  end

  def logged_in?
    @current_user.present?
  end

  def is_admin?
    @current_user.admin?
  end
end
