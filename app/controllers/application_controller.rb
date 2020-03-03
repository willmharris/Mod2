class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_dm

  def current_dm
    @dm = (Dm.find_by(id: session[:dm_id]) || Dm.new)
  end

  def logged_in?
    current_dm.id != nil
  end

  def require_logged_in
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end
end