class RoomsController < ApplicationController

  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def edit
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
  	@room = Room.find(params[:id])
  end end

  def update
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @room = Room.find(params[:id])
  	  if (@room.update_attributes(room_params))
  		  redirect_to(:action => "index")
        updateMessage(session[:lan])
  	  else
  		  render("edit")
  	  end
    end
  end

  def index
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
  	  @rooms = Room.all
    end
  end
  def new
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
  	  @room =Room.new
    end
  end

  def create
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @room = Room.new(room_params)
  	  if(@room.save)
  		  redirect_to(:action => "index")
        createMessage(session[:lan])
  	  else
  		  render("new")
  	  end
    end
  end

  def show
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
  	  @room = Room.find(params[:id])
    end
  end

  def destroy
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @room = Room.find(params[:id])
  	  @room.destroy
  	  redirect_to(:action => "index")
    end
  end

  private

  def room_params
  	params.require(:room).permit(:name, :comment)
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