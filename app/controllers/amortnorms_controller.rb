class AmortnormsController < ApplicationController
  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
    update_time_of_use
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
    else
      @amortnorms = Amortnorm.all
    end
  end

  def new
    update_time_of_use
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
    else
      @amortnorm = Amortnorm.new
    end
  end

  def create
    @amortnorm = Amortnorm.new(amortnorm_params)
    if(@amortnorm.save)
      redirect_to(:action => "index")
        flash[:notice] = l(:createMessage)
      else
        render("new")
      end
  end

  def show
    update_time_of_use
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
    end
  end

  def update
     @amortnorm = Amortnorm.find(params[:id])
      if (@amortnorm.update_attributes(amortnorm_params))
        redirect_to(:action => "index")
        flash[:notice] = l(:updateMessage)
      else
        render("edit")
      end
  end

  def edit
    update_time_of_use
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
    else
      @amortnorm = Amortnorm.find(params[:id])
    end
  end

  def destroy
    @amortnorm = Amortnorm.find(params[:id])
      @amortnorm.destroy
      redirect_to(:action => "index")
  end

  private
    def amortnorm_params
    params.require(:amortnorm).permit(:name, :comment)
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