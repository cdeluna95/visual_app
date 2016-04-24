class VisualsController < ApplicationController
    before_action :find_visual, only: [:show, :edit, :update, :destroy]
    
    def index
        @visuals = Visual.all.order("created_at DESC")
    end
    
    def show
    end
    
    def new
        @visual = current_user.visuals.build
    end
    
    def create
        @visual = current_user.visuals.build(visual_params)
        if @visual.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @visual.update(visual_params)
            redirect_to visual_path(@visual)
        else
            render 'edit'
        end
    end
    
    def destroy
        @visual.destroy
        redirect_to root_path
    end
    
    private
    
    def visual_params
        params.require(:visual).permit(:title, :description, :creator)
    end
    
    def find_visual
        @visual = Visual.find(params[:id])
    end
end
