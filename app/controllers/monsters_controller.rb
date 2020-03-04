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
        @action = Action.new 
        @default = 10 
    end 

    def create 
        @monster = Monster.new(monster_params)
        if @monster.valid? 
            @monster.save 
            @monster.update(creator_id: @dm.id)
            DmMonster.create(dm_id: @dm.id, monster_id: @monster.id)
            @ability = Ability.new(name: params[:monster][:ability][:name], description: params[:monster][:ability][:description], monster_id: @monster.id)
            if @ability.name || @ability.description 
                unless @ability.name
                    @ability.name = "Please add a name"
                end 
                unless @ability.description 
                    @ability.description = "Please add a description"
                end 
                @ability.save 
            end 
            @action = Action.new(name: params[:monster][:action][:name], description: params[:monster][:action][:description], monster_id: @monster.id)
            if @action.name || @action.description 
                unless @action.name
                    @action.name = "Please add a name"
                end 
                unless @action.description 
                    @action.description = "Please add a description"
                end 
                @action.save 
            end 
            redirect_to monster_path(@monster)
        else 
            render :new 
        end 
    end 

    def edit 
        if session[:dm_id] != @monster.creator_id
            redirect_to dm_path(@dm)
        end 
        @ability = @monster.abilities.first
        @action = @monster.actions.first
    end 

    def update 
        @updated_monster = Monster.new(monster_params)
        if @updated_monster.valid?
            @monster.update(monster_params)
            @ability = Ability.find_by(monster_id: @monster.id)
            @ability.update(name: params[:monster][:ability][:name], description: params[:monster][:ability][:description] )
            @action = Action.find_by(monster_id: @monster.id)
            @action.update(name: params[:monster][:action][:name], description: params[:monster][:action][:description] )
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
