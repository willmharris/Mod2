class DmsController < ApplicationController
    
    before_action :require_logged_in, except: [:new, :create]

    def index 
        @dms = Dm.all 
    end 

    def show 
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
    end 

    def update 
        @dm.update(dm_params)
        DmMonster.create(monster_id: params[:id], dm_id: params[:dm][:id]) 
        redirect_to dm_path(@dm)
    end 

    def destroy 
        @dm.destroy 
        redirect_to dms_path 
    end 

    private 

    def find_dm 
        @dm = Dm.find(params[:id])
    end 

    def dm_params 
        params.require(:dm).permit(:name, :password, :password_confirmation)
    end 

end
