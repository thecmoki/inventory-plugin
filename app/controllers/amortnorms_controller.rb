class AmortnormsController < ApplicationController
  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])


  def new
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
      @amortnorm = Amortnorm.new
    end
  end

  def index
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
      @amortnorms = Amortnorm.all
       if(session[:lan] == nil)
        session[:lan] = "en"
      elsif(params[:lan] == "en" || params[:lan] == "al")
        session[:lan] = params[:lan]
      else
        session[:lan]
      end
    end
  end

  def create
    @amortnorm = Amortnorm.new(amortnorm_params)
    if(@amortnorm.save)
      redirect_to(:action => "index")
        createMessage(session[:lan])
      else
        render("new")
      end
  end

  def show
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    end
  end

  def update
     @amortnorm = Amortnorm.find(params[:id])
      if (@amortnorm.update_attributes(amortnorm_params))
        redirect_to(:action => "index")
        updateMessage(session[:lan])
      else
        render("edit")
      end
  end

  def edit
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
      @amortnorm = Amortnorm.find(params[:id])
    end
  end
  def destroy
    @amortnorm = Amortnorm.find(params[:id])
      @amortnorm.delete
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