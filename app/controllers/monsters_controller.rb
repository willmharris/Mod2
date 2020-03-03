class MonstersController < ApplicationController

    before_action :require_logged_in
    before_action :find_monster, only: [:show, :edit, :update, :destroy]

    def index 
        @monsters = Monster.all 
    end 

    def show 
        @creator = Dm.find(@monster.creator_id)
    end 

    def new 
        @monster = Monster.new 
        @default = 10 
    end 

    def create 
        @monster = Monster.new(monster_params)
        if @monster.valid? 
            @monster.save 
            @monster.update(creator_id: @dm.id)
            DmMonster.create(dm_id: @dm.id, monster_id: @monster.id)
            redirect_to monster_path(@monster)
        else 
            render :new 
        end 
    end 

    def edit 
        if session[:dm_id] != @monster.creator_id
            redirect_to dm_path(@dm)
        end 
    end 

    def update 
        @updated_monster = Monster.new(monster_params)
        if @updated_monster.valid?
            @monster.update(monster_params)
            redirect_to monster_path(@monster)
        else 
            render :edit 
        end 
    end 

    def destroy 
        @monster.destroy 
        redirect_to monsters_path 
    end 

    def add 
        DmMonster.create(dm_id: session[:dm_id], monster_id: params[:id])
        redirect_to dm_path(@dm)
    end 

    def remove 
        DmMonster.find_by(dm_id: session[:dm_id], monster_id: params[:id]).destroy
        redirect_to dm_path(@dm)
    end 

    private 

    def find_monster
        @monster = Monster.find(params[:id])
    end 

    def monster_params 
        params.require(:monster).permit(:name, :size, :category, :alignment, :ac, :hp, :speed, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :cr, :image)
    end 

end
