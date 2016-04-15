class RoomsController < ApplicationController
  menu_item :overviews, :only => [:index, :show, :edit, :new, :update, :create]
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
    update_time_of_use
    @rooms = Room.all
  end

  def edit
    update_time_of_use
  	@room = Room.find(params[:id])
  end

  def update
	  @room = Room.find(params[:id])
	  if (@room.update_attributes(room_params))
      @locations = Location.all
      @locations.each do |location|
        if(location.id == @room.location.id)
          @room.update(:prefix_id => location.prefix + "-" + @room.prefix_id.to_s)
        end
      end
		  redirect_to(:action => "index")
      flash[:notice] = l(:updateMessage)
	  else
		  render("edit")
    end
  end

  def new
    update_time_of_use
  	@room = Room.new
  end

  def create
	  @room = Room.new(room_params)
	  if(@room.save)
      @locations = Location.all
      @locations.each do |location|
        if(location.id == @room.location.id)
          @room.update(:prefix_id => location.prefix + "-" + @room.prefix_id.to_s)
        end
      end
		  redirect_to(:action => "index")
      flash[:notice] = l(:createMessage)
	  else
		  render("new")
	  end
  end

  def show
    update_time_of_use
  	@room = Room.find(params[:id])
  end

  def destroy
	  @room = Room.find(params[:id])
	  @room.destroy
	  redirect_to(:action => "index")
  end

  private

  def room_params
  	params.require(:room).permit(:name, :prefix_id, :location_id, :comment)
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