class HistoriesController < ApplicationController
  menu_item :overviews, :only => [:index]
  before_filter(:find_project, :authorize, :only => [:index])

  def index
    update_time_of_use
  	@users = User.all
    if(User.current.admin == true)
      if params[:q]  == nil
        @search = History.search(params[:q])
        @histories = @search.result.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
        @search.build_condition if @search.conditions.empty?
        @search.build_sort if @search.sorts.empty?
      else
        @search = History.search(params[:q])
        @histories = @search.result.paginate(:page => params[:page]).order("created_at DESC")
        @search.build_condition if @search.conditions.empty?
        @search.build_sort if @search.sorts.empty?
      end
    else
      @histories = History.all
      @search = History.search(params[:q])
      @search.build_condition if @search.conditions.empty?
      @search.build_sort if @search.sorts.empty?
    end
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
