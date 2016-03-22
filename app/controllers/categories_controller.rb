class CategoriesController < ApplicationController
  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
    update_time_of_use
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
    else
  	  @categories = Category.all
    end
  end

  def show
    update_time_of_use
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
    else
  	  @category = Category.find(params[:id])
    end
  end

  def edit
    update_time_of_use
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
    else
  	  @category = Category.find(params[:id])
    end
  end

  def new
    update_time_of_use
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      eflash[:error] = l(:errorMessage)
    else
  	  @category = Category.new
    end
  end

  def create
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @category = Category.new(category_params)
  	  if(@category.save)
  		  redirect_to(:action => "index")
        flash[:notice] = l(:createMessage)
  	  else
  		  render("new")
  	  end
    end
  end
  def update
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @category = Category.find(params[:id])
      if (@category.update_attributes(category_params))
        redirect_to(:action => "index")
        flash[:notice] = l(:updateMessage)
      else 
        render("edit") 
  	  end 
    end
  end

  def destroy
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @category = Category.find(params[:id])
  	  @category.destroy
  	  redirect_to(:action => "index")
    end
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