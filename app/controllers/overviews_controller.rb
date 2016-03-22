class OverviewsController < ApplicationController

before_filter(:find_project, :authorize, :only => [:index])

 def index
  	update_time_of_use
  	@users = User.all
  	@inventories = Inventory.all
    @categories = Category.all
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
