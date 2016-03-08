class HistoriesController < ApplicationController

  before_filter(:find_project, :authorize, :only => [:index])

  def index
  	@histories = History.all
  	@users = User.all
    @search = History.search(params[:q])
    @histories = @search.result.paginate(:page => params[:page], :per_page => 15)
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
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
