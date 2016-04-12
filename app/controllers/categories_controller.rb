class CategoriesController < ApplicationController
  menu_item :overviews, :only => [:index, :show, :edit, :new, :update, :create]
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
    update_time_of_use
  	@categories = Category.all
  end

  def show
    update_time_of_use
  	@category = Category.find(params[:id])
  end

  def edit
    update_time_of_use
  	@category = Category.find(params[:id])
  end

  def new
    update_time_of_use
  	@category = Category.new
  end

  def create
	  @category = Category.new(category_params)
	  if(@category.save)
		  redirect_to(:action => "index")
      flash[:notice] = l(:createMessage)
	  else
		  render("new")
    end
  end

  def update
	  @category = Category.find(params[:id])
    if (@category.update_attributes(category_params))
      redirect_to(:action => "index")
      flash[:notice] = l(:updateMessage)
    else 
      render("edit") 
	  end 
  end

  def destroy
	  @category = Category.find(params[:id])
	  @category.destroy
	  redirect_to(:action => "index")
  end

 private

  def category_params
    params.require(:category).permit(:name, :comment, :prefixid)
  end

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end

  def update_time_of_use
    @inventories = Inventory.all
    @inventories.each do |inventory|
      inventory.update(:time_of_use => inventory.days)
    end
  end
end