class SessionsController < ApplicationController 
    
    def new 
    end 

    def create 
        session[:username] = params[:username]
        redirect_to '/dms'
    end 

    def logout 
        session.clear 
        redirect_to '/'
    end 
end 