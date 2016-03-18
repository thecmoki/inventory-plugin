require 'securerandom'
class UnitsController < ApplicationController  

  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
    else
  	  @units = Unit.all
      @categories = Category.all
    end
  end
  
  def show
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
    else
  	  @unit = Unit.find(params[:id])
    end
  end
  
  def edit
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
    else
  	  @unit = Unit.find(params[:id])
    end
  end
  
  def update
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @unit = Unit.find(params[:id])
  	  if (@unit.update_attributes(unit_params))
  		  redirect_to(:action => "index")
        flash[:notice] = l(:updateMessage)
  	  else
  		  render(:controller => "units", :action => "edit")
  	  end
    end
  end
  
  def new
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
    else
  	  @unit = Unit.new
    end
  end

  

  
  def create
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @unit = Unit.new(unit_params)
  	  if(@unit.save)
  		  redirect_to(:action => "index")
        flash[:notice] = l(:createMessage)
  	  else
  		  render("new")
  	  end
    end
  end
  
  def destroy
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @unit = Unit.find(params[:id])
  	  @unit.destroy
  	  redirect_to(:action => "index")
    end
  end

  private
  
  def unit_params
    params.require(:unit).permit(:name, :normamort, :comment, :category_id, :quantity)
  end

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end
end