class SessionsController < ApplicationController
    def new
    end
  
    def create
      dm = Dm.find_by(name: params[:dm][:name])
      dm = dm.try(:authenticate, params[:dm][:password])
      if dm 
        session[:dm_id] = dm.id
        @dm = dm
        redirect_to dm_path(@dm)
      else 
        flash[:error] = "Incorrect login"
        redirect_to controller: 'sessions', action: 'new'
      end 
    end
  
    def destroy
      session.clear 
      redirect_to '/'
    end
  end