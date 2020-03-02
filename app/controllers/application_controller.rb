class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :cart, :require_login
  
    def cart
      session[:cart] ||= [] # if not defined, set it equal to an empty array 
    end

    def require_login
      return head(:forbidden) unless session.include? :username
  end 
end
