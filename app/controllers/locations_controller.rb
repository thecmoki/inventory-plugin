class LocationsController < ApplicationController

   menu_item(:overviews, :only => [:index, :show, :edit, :new, :update, :create])
   before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
  	@locations = Location.all
  end

  def new
  	@location = Location.new
  end

  def show
  	@location = Location.find(params[:id])
  end

  def edit
  	@location = Location.find(params[:id])
  end

  def create
  	@location = Location.new(location_params)
  	if(@location.save)
  		redirect_to(:action => "index")
  	else
  		render(:action => "new")
  	end
  end

  def update
  	@location = Location.find(params[:id])
  	if(@location.update_attributes(location_params))
  		redirect_to(:action => "index")
  	else
  		render(:action => "edit")
  	end
  end

  def destroy
  	@location = Location.find(params[:id])
  	@location.destroy
  	redirect_to(:action => "index")
  end

  private

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end

  def location_params
  	params.require(:location).permit(:name, :description)
  end
end
