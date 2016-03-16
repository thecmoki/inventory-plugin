class OverviewsController < ApplicationController

before_filter(:find_project, :authorize, :only => [:index])

 def index
  	#@histories = History.all
  	@users = User.all
  	@inventories = Inventory.all
    

  	if(session[:lan] == nil)
      session[:lan] = "en"
    elsif(params[:lan] == "en" || params[:lan] == "al")
      session[:lan] = params[:lan]
    else
      session[:lan]
    end
  end
  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end
end
