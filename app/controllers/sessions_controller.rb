class SessionsController < ApplicationController
    def new
    end
  
    def create
      dm = Dm.find_by(name: params[:dm][:name])
      dm = dm.try(:authenticate, params[:dm][:password])
      return redirect_to(controller: 'sessions', action: 'new') unless dm
      session[:dm_id] = dm.id
      @dm = dm
      redirect_to controller: 'welcome', action: 'home'
    end
  
    def destroy
      session.clear 
      redirect_to '/'
    end
  end