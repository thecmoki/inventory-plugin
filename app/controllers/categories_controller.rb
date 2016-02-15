class CategoriesController < ApplicationController
  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if(@category.save)
  		redirect_to(:action => "index")
  	else
  		render("new")
  	end
  end

  def update
  	@category = Category.find(params[:id])
    if (@category.update_attributes(category_params))
      redirect_to(:action => "index") 
    else 
      render("edit") 
  	end 
  end

  def destroy
  	@category = Category.find(params[:id])
  	@category.delete
  	redirect_to(:action => "index")
 end

 private

  def category_params
    params.require(:category).permit(:name, :comment)
  end

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end

end