class UnitsController < ApplicationController
  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])
  
  def index
  	@units = Unit.all
    @categories = Category.all
  end
  
  def show
  	@unit = Unit.find(params[:id])
  end
  
  def edit
  	@unit = Unit.find(params[:id])
  end
  
  def update
  	@unit = Unit.find(params[:id])
  	if (@unit.update_attributes(unit_params))
  		redirect_to(:action => "index")
  	else
  		render(:controller => "units", :action => "edit")
  	end
  end
  
  def new
  	@unit = Unit.new
  end 
  
  def create
  	@unit = Unit.new(unit_params)
  	if(@unit.save)
  		redirect_to(:action => "index")
  	else
  		render("new")
  	end
  end
  
  def destroy
  	@unit = Unit.find(params[:id])
  	@unit.delete
  	redirect_to(:action => "index")
  end

  private
  
  def unit_params
    params.require(:unit).permit(:name, :comment, :category_id, :quantity, :color)
  end

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end
  
end