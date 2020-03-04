class ActionsController < ApplicationController

    def create
        action = Action.create(name: params[:name], description: params[:description], monster_id: params[:monster_id])
        redirect_to monster_path(action.monster.id)
    end 

    def update
        action = Action.find(params[:action_id])
        action.update(name: params[:name], description: params[:description])
        redirect_to monster_path(action.monster.id)
    end 

end 