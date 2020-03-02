class SessionsController < ApplicationController 
    
    def login
    end 

    def validate
        session[:name] = params[:name]
        @dm = Dm.find_by(name: session[:name])
        redirect_to dm_path(@dm)
    end 

    def logout 
        session.clear 
        redirect_to '/welcome'
    end 
end 