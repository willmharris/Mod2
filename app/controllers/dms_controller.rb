class DmsController < ApplicationController
    
    before_action :require_logged_in, except: [:new, :create]

    def index 
        @dms = Dm.all 
    end 

    def show 
        if my_profile?
            @mine = true 
        else 
            @mine = false
        end 
    end 

    def new 
        @dm = Dm.new 
    end 

    def create 
        @dm = Dm.new(dm_params)
        if @dm.valid? 
            @dm.save
            session[:dm_id] = @dm.id
            redirect_to dm_path(@dm)
        else 
            render :new
        end 
    end 

    def edit 
        unless my_profile?
            redirect_to dm_path(@dm)
        end 
    end 

    def update 
        @dm.update(dm_params)
        redirect_to dm_path(@dm)
    end 

    def destroy 
        @dm.destroy 
        redirect_to dms_path 
    end 

    private 

    def dm_params 
        params.require(:dm).permit(:name, :password, :password_confirmation, :email)
    end 

    def my_profile?
        @this_dm = Dm.find(params[:id])
        @this_dm.id == @dm.id
    end 

end
