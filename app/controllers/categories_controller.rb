class CategoriesController < ApplicationController
  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = "You have no access."
    else
  	  @categories = Category.all
    end
  end

  def show
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = "You have no access."
    else
  	  @category = Category.find(params[:id])
    end
  end

  def edit
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = "You have no access."
    else
  	  @category = Category.find(params[:id])
    end
  end

  def new
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = "You have no access."
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
        flash[:notice] = "Category successful created."
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
        flash[:notice] = "Successful update."
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
  	  @category.delete
  	  redirect_to(:action => "index")
    end
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