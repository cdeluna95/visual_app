class VisualsController < ApplicationController
    before_action :find_visual, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:category].blank?
            @visuals = Visual.all.order("created_at DESC")
        else
            @category_id = Category.find_by(name: params[:category]).id
            @visuals = Visual.where(:category_id => @category_id).order("created_at DESC")
        end
    end

    def show
    end
    
    def new
        @visual = current_user.visuals.build
        @categories = Category.all.map { |c| [c.name, c.id] }
    end
    
    def create
        @visual = current_user.visuals.build(visual_params)
        @visual.category_id = params[:category_id]
        if @visual.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def edit
        @categories = Category.all.map { |c| [c.name, c.id] }
    end
    
    def update
        @visual.category_id = params[:category_id]
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
        params.require(:visual).permit(:title, :description, :creator, :category_id, :visual_img)
    end
    
    def find_visual
        @visual = Visual.find(params[:id])
    end
end
