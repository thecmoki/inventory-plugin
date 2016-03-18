class RoomsController < ApplicationController

  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
    else
      @rooms = Room.all
    end
  end

  def edit
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
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
        flash[:notice] = l(:updateMessage)
  	  else
  		  render("edit")
  	  end
    end
  end

  def new
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
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
        flash[:notice] = l(:createMessage)
  	  else
  		  render("new")
  	  end
    end
  end

  def show
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = l(:errorMessage)
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
end