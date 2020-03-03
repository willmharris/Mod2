class MonstersController < ApplicationController

    before_action :require_logged_in
    before_action :find_monster, only: [:show, :edit, :update, :destroy]

    def index 
        @monsters = Monster.all 
    end 

    def show 
        @creator = Dm.find(@monster.creator_id).name
    end 

    def new 
        @monster = Monster.new 
    end 

    def create 
        @monster = Monster.new(monster_params)
        if @monster.valid? 
            @monster.save 
            @monster.update(creator_id: @dm.id)
            redirect_to monster_path(@monster)
        else 
            render :new 
        end 
    end 

    def edit 
    end 

    def update 
        @updated_monster = Monster.new(monster_params)
        if @updated_monster.valid?
            @monster.update(monster_params)
            DmMonster.create(monster_id: params[:id], dm_id: params[:monster][:id])
            redirect_to monster_path(@monster)
        else 
            render :edit 
        end 
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
        params.require(:monster).permit(:name, :size, :category, :alignment, :ac, :hp, :speed, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :cr)
    end 

end
