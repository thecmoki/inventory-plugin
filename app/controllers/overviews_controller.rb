class OverviewsController < ApplicationController

before_filter(:find_project, :authorize, :only => [:index])

 def index
  	#@histories = History.all
  	@users = User.all
  	@inventories = Inventory.all
    @categories = Category.all
  end
  
  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end
end
