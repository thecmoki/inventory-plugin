class RoomsController < ApplicationController

  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def edit
  	@room = Room.find(params[:id])
  end

  def update
  	@room = Room.find(params[:id])
  	if (@room.update_attributes(room_params))
  		redirect_to(:action => "index")
  	else
  		render("edit")
  	end
  end

  def index
  	@rooms = Room.all
  end

  def new
  	@room =Room.new
  end

  def create
  	@room = Room.new(room_params)
  	if(@room.save)
  		redirect_to(:action => "index")
  	else
  		render("new")
  	end
  end

  def show
  	@room = Room.find(params[:id])
  end

  def destroy
  	@room = Room.find(params[:id])
  	@room.delete
  	redirect_to(:action => "index")
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