class CategoriesController < ApplicationController
  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
    if(session[:lan] == nil)
      session[:lan] = "en"
    elsif(params[:lan] == "en" || params[:lan] == "al")
      session[:lan] = params[:lan]
    else
      session[:lan]
    end
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
  	  @categories = Category.all
    end
  end

  def show
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
  	  @category = Category.find(params[:id])
    end
  end

  def edit
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
  	  @category = Category.find(params[:id])
    end
  end

  def new
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
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
        createMessage(session[:lan])
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
        updateMessage(session[:lan])
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
    params.require(:category).permit(:name, :comment, :prefixid)
  end

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end
  def errorMessage(lan = "en")
    if(lan == "en")
      flash[:error] = "You have no access."
    elsif(lan == "al")
      flash[:error] = "Ju nuk keni qasje."
    end
  end
  def updateMessage(lan = "en")
    if(lan == "en")
      flash[:notice] = "Successful update."
    elsif(lan == "al")
      flash[:notice] = "U ndryshua me sukses."
    end
  end
  def createMessage(lan = "en")
    if(lan == "en")
      flash[:notice] = "Successful created."
    elsif(lan == "al")
      flash[:notice] = "U krijua me sukses"
    end
  end
end