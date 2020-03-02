class DmsController < ApplicationController

    before_action :find_dm, only: [:show, :edit, :update, :destroy]

    def index 
        @dms = Dm.all 
    end 

    def show 
    end 

    def new 
        @dm = Dm.new 
    end 

    def create 
        @dm = Dm.create(dm_params)
        redirect_to dm_path(@dm)
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

    def test 
        render :test
    end 
    
    def add
        cart << params[:monster]
        render :test
    end

    private 

    def find_dm 
        @dm = Dm.find(params[:id])
    end 

    def dm_params 
        params.require(:dm).permit(:name)
    end 

end
