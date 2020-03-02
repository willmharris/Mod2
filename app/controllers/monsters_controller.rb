class MonstersController < ApplicationController

    before_action :require_login
    before_action :find_monster, only: [:show, :edit, :update, :destroy]

    def index 
        @monsters = Monster.all 
    end 

    def show 
    end 

    def new 
        @monster = Monster.new 
    end 

    def create 
        @monster = Monster.create(monster_params)
        redirect_to monster_path(@monster)
    end 

    def edit 
    end 

    def update 
        @monster.update(monster_params)
        DmMonster.create(monster_id: params[:id], dm_id: params[:monster][:id])
        redirect_to monster_path(@monster)
    end 

    def destroy 
        @monster.destroy 
        redirect_to monsters_path 
    end 

    private 

    def find_monster
        @monster = Monster.find(params[:id])
    end 

    def monster_params 
        params.require(:monster).permit(:name)
    end 

end
