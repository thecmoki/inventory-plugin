class InventoriesController < ApplicationController
  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
  	@inventories = Inventory.all
  end

  def show
  	@inventory = Inventory.find(params[:id])
  end

  def edit
  	@inventory = Inventory.find(params[:id])
  end

  def new
  	@inventory = Inventory.new
  end

  def create
  	@inventory = Inventory.new(inventory_params)
  	if(@inventory.save)
  		redirect_to(:action => "index")
  	else
  		render("new")
  	end
  end

  def update
  	@inventory = Inventory.find(params[:id])
  	if (@inventory.update_attributes(inventory_params))
  		redirect_to(:action => "index")
  	else
  		render("edit")
  	end
  end

  def destroy
  	@inventory = Inventory.find(params[:id])
  	@inventory.delete
  	redirect_to(:action => "index")
  	end

  	private
    
  	def inventory_params
  		params.require(:inventory).permit(:room_id, :time_of_use, :user_id, :stock_id)
  	end

    def find_project
      # @project variable must be set before calling the authorize filter
      @project = Project.find(params[:project_id])
    end

  end