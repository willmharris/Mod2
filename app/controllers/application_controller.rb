class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :cart
  
    def cart
      session[:cart] ||= [] # if not defined, set it equal to an empty array 
    end
end
