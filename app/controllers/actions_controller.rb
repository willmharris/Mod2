class ActionsController < ApplicationController

    before_action :find_action, except: [:create]

    def create
        action = Action.create(name: params[:name], description: params[:description], monster_id: params[:monster_id])
        home_monster
    end 

    def update
        @action.update(name: params[:name], description: params[:description])
        home_monster
    end 

    def destroy
        @action.destroy 
        home_monster
    end 

    private

    def find_action
        @action = Action.find(params[:id])
    end 

    def home_monster
        redirect_to monster_path(Monster.last)
    end 

end 