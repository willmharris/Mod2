class MonstersController < ApplicationController

    before_action :require_logged_in
    before_action :find_monster, only: [:show, :edit, :update, :destroy, :add, :remove]
    @@monsters = nil

    def index 
        @monsters = Monster.all
        if @@monsters 
            @monsters = @@monsters
        end 
    end 

    def order 
        @monsters = Monster.all
        category = params[:category]
        min = params[:minimum].to_i
        max = params[:maximum].to_i
        unless category == "Any"
            @monsters = @monsters.select do |m|
                m.category == category
            end 
        end 
        if min || max 
            if max == 0
                max = 100
            end 
            @monsters = @monsters.select do |m|
                m.cr >= min && m.cr <= max
            end 
        end 
        if params[:order] == "Alphabetically"
            @@monsters = @monsters.sort_by {|m| m.name} 
        else 
            @@monsters = @monsters.sort_by {|m| m.popularity}.reverse
        end 
        redirect_to monsters_path 
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
            @monster.update(creator_id: @dm.id, popularity: 0)
            DmMonster.create(dm_id: @dm.id, monster_id: @monster.id)
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
        DmMonster.find_or_create_by(dm_id: session[:dm_id], monster_id: params[:id])
        increased_popularity = @monster.popularity + 1 
        @monster.update(popularity: increased_popularity)
        redirect_to dm_path(@dm)
    end 

    def remove 
        DmMonster.find_by(dm_id: session[:dm_id], monster_id: params[:id]).destroy
        decreased_popularity = @monster.popularity - 1
        @monster.update(popularity: decreased_popularity)
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
